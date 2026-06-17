import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/routing/app_router.dart';
import '../../../../Core/utlils/app_images.dart';
import '../../../../Core/di/dependency_injection.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../../logic/cubit/auth_state.dart';
import '../../ui/widgets/auth_divider.dart';
import '../../ui/widgets/auth_primary_button.dart';
import '../../ui/widgets/auth_text_field.dart';
import '../../ui/widgets/social_login_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final authCubit = getIt<AuthCubit>();
    final rememberMe = await authCubit.getRememberMe();
    
    if (rememberMe && mounted) {
      final savedEmail = await authCubit.getSavedEmail();
      final savedPassword = await authCubit.getSavedPassword();
      setState(() {
        _rememberMe = true;
        if (savedEmail != null) _emailController.text = savedEmail;
        if (savedPassword != null) _passwordController.text = savedPassword;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        rememberMe: _rememberMe,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                GoRouter.of(context).pushReplacement(AppRouter.kMainLayoutScreen);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Center(
                        child:
                            Image.asset(AppImages.loginLogo, width: 162, height: 114),
                      ),

                      const SizedBox(height: 36),

                      const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const SizedBox(height: 20),

                      AuthTextField(
                        hint: 'abc@email.com',
                        prefixIcon: Icons.mail_outline_rounded,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) =>
                            (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
                      ),
                      const SizedBox(height: 14),

                      AuthTextField(
                        hint: 'Your password',
                        prefixIcon: Icons.lock_outline_rounded,
                        isPassword: true,
                        controller: _passwordController,
                        validator: (v) =>
                            (v == null || v.length < 6) ? 'Min 6 characters' : null,
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Switch(
                            value: _rememberMe,
                            onChanged: (v) => setState(() => _rememberMe = v),
                            activeColor: const Color(0xFF4D6FFF),
                          ),
                          const Text('Remember Me',
                              style: TextStyle(fontSize: 13, color: Color(0xFF1A1A2E))),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 13, color: Color(0xFF4D6FFF)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      AuthPrimaryButton(
                        label: 'SIGN IN',
                        onPressed: () => _signIn(context),
                        isLoading: isLoading,
                      ),
                      const SizedBox(height: 24),

                      const AuthDivider(),
                      const SizedBox(height: 20),

                      SocialLoginButton(
                        label: 'Login with Google',
                        iconAsset: AppImages.googleLogo,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 12),
                      SocialLoginButton(
                        label: 'Login with Facebook',
                        iconAsset: AppImages.facebookLogo,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ",
                                style: TextStyle(color: Colors.grey[500], fontSize: 13)),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kSignUpScreen);
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color(0xFF4D6FFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}