import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/services/services_locator.dart';
import 'package:shop_app/features/favorite/presentation/components/favorite_component.dart';
import 'package:shop_app/features/favorite/presentation/controller/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<FavoriteCubit>()..getFavorite(),
        child: Scaffold(
          body: Column(
            children:
            [
              Expanded(child: FavoriteComponent()),
            ],
          ),
        ));
  }
}