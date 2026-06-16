import 'package:json_annotation/json_annotation.dart';
import '../entities/home_category_entity.dart';

part 'home_classification_dto.g.dart';

@JsonSerializable()
class HomeClassificationDto {
  final String id;
  final String name;

  const HomeClassificationDto({
    this.id = '',
    this.name = '',
  });

  factory HomeClassificationDto.fromJson(Map<String, dynamic> json) {
    final segment = json['segment'];

    if (segment is! Map) {
      return const HomeClassificationDto();
    }

    return HomeClassificationDto(
      id: segment['id'] is String ? segment['id'] as String : '',
      name: segment['name'] is String ? segment['name'] as String : '',
    );
  }

  Map<String, dynamic> toJson() => _$HomeClassificationDtoToJson(this);

  HomeCategoryEntity? toEntity() {
    final categoryName = name.trim();

    if (categoryName.isEmpty) return null;

    return HomeCategoryEntity(
      id: id.trim(),
      name: categoryName == 'Undefined' ? 'Default' : categoryName,
      apiName: categoryName,
    );
  }
}