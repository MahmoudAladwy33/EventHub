import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/routing/app_router.dart';
import '../../../../Core/utlils/app_images.dart';
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
  bool _rememberMe = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) setState(() => _isLoading = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  onPressed: (){ GoRouter.of(context).push(AppRouter.kEventsScreen);
                    },
                  //_signIn,
                  isLoading: _isLoading,
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
        ),
      ),
    );
  }
}