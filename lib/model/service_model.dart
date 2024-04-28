import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_model.g.dart';
part 'service_model.freezed.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    String? id,
    String? name,
    String? surname,
    String? field,
    String? about,
    String? latitude,
    String? longitude,
    String? ratingRank,
    String? salary,
    String? image,
    @Default(false) bool isSaved,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}
