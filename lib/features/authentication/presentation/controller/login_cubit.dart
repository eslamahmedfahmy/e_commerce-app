import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/dummy/constant.dart';
import 'package:shop_app/core/utils/dummy/shared%20_pref.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';
import 'package:shop_app/features/authentication/domain/usecase/sign_in.dart';

part 'login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.signInUseCase) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);


  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangePasswordState());
  }

  SignInUseCase signInUseCase;
  dynamic loginCubit;

  FutureOr<void> signIn({
    required String email,
    required String password,
  }) async
  {
    emit(LoginLoadingState());
    final result = await signInUseCase(SignInParameters(
        {
          'email': email,
          'password': password,
        }));

    result.fold((l)
    {
      emit(LoginErrorState(l.message));
    },
            (r) {
          print('mohamed Thanks god');
          loginCubit = r;
          print(loginCubit);
          PreferenceUtils.setString(SharedKeys.token, r.data!.token);
          token = r.data!.token;
          emit(LoginSuccessState(r));
        }
    );



  }
}

