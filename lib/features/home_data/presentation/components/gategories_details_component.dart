import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/core/utils/dummy/constant.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';
import 'package:shop_app/features/home_data/presentation/screens/product_details_screen.dart';

class CategoriesDetailsComponent extends StatelessWidget {
  const CategoriesDetailsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state)
      {
        var cubit = HomeCubit.get(context);
        return  cubit.categoriesDetails.isEmpty ? Center(child: CircularProgressIndicator()): GridView.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5.h,
            crossAxisSpacing: 5.w,
            pattern: [
              const WovenGridTile(5 / 8),
              const WovenGridTile(
                5 / 8,
                alignment: AlignmentDirectional.bottomCenter,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              childCount: cubit.categoriesDetails.length,
                  (context, index) => (cubit.categoriesDetails.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : categoriesDetails(cubit, index, context)),
        );
      },
    );
  }

  Padding categoriesDetails(HomeCubit cubit, int index, BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 8.0, left: 12, right: 10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Row(
            children: [
              IconButton(
                onPressed: ()
                {
                  print(' I came ********************');
                  cubit.addItemToFavorite(id: cubit.categoriesDetails[index].id);
                },
                icon: cubit.favorite[cubit.categoriesDetails[index].id] ?? true ? Icon(
                  Icons.favorite,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ) : Icon(
                  Icons.favorite_border,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: ()
                {
                  print(' I came After To Add To Cart ********************');
                  cubit.addItemToCart(id: cubit.categoriesDetails[index].id);
                },
                icon: cubit.cart[cubit.categoriesDetails[index].id] ?? true ? Icon(
                  Icons.shopping_cart,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ):Icon(
                  Icons.add_shopping_cart,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: ()
            {
              navigateTo(context, ProductDetailsScreen(productId: cubit.categoriesDetails[index].id,));

            },
            child: Image(
              image: NetworkImage(
                  cubit.categoriesDetails[index].image),
              width: double.infinity,
              height: 136.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 12.h,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10, right: 10, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    cubit.categoriesDetails[index].name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall?.apply(fontSizeFactor: 1.sp),
                  ),
                  height: 40.h,
                ),
                SizedBox(height: 5.h,),
                Row(
                  children:
                  [
                    Text(
                      '${cubit.categoriesDetails[index].price.round()} LE',
                      style: Theme.of(context).textTheme.displaySmall?.apply(fontSizeFactor: 1.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    if (cubit.categoriesDetails[index].discount !=
                        0)
                      Text(
                        '${cubit.categoriesDetails[index].oldPrice.round()}',
                        style:  TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration:
                          TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}