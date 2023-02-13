import 'package:shop_app/features/authentication/data/model/data_model.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';

class AuthModel extends Authentication {
  const AuthModel({
    required super.status,
    required super.message,
    super.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };

}