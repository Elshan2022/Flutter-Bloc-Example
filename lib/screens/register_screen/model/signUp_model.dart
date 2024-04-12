// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'signUp_model.freezed.dart';
part 'signUp_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
     String? email,
     String? password,
     String? confirmPassword,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
