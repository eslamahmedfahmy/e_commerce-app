import 'package:equatable/equatable.dart';
import 'package:shop_app/features/authentication/domain/entites/data.dart';


class Authentication extends Equatable {
  final bool status;
  final String message;
  final Data? data;

  const Authentication({
    required this.status,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props =>
      [
        status,
        message,
        data,
      ];
}