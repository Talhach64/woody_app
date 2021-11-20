import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel {
  String username;
  String password;

  LoginModel({required this.username, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}


// import 'package:json_annotation/json_annotation.dart';
//
// part 'login_model.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class LoginModel {
//   String username;
//   String password;
//
//   LoginModel({required this.username, required this.password});
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) =>
//       _$LoginModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LoginModelToJson(this);
// }
