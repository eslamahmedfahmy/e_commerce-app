import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';
import 'package:shop_app/features/authentication/domain/usecase/sign_in.dart';
import 'package:shop_app/features/authentication/domain/usecase/sign_up.dart';

abstract class AuthBaseRepository
{
  Future<Either<Failure, Authentication>> signIn(SignInParameters parameters);
  Future<Either<Failure, Authentication>> signUp(SignUpParameters parameters);
}