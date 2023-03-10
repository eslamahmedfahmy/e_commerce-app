import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/utils/dummy/app_color.dart';
import 'package:shop_app/core/utils/dummy/app_string.dart';
import 'package:shop_app/core/utils/dummy/component_in_general.dart';
import 'package:shop_app/core/utils/dummy/constant.dart';
import 'package:shop_app/features/home_data/presentation/screens/bottom_nav_screen.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 33, right: 33, top: 40, bottom: 65).r,
        child: Column(
          children:
          [
            Container(
              height: 418.7.h,
              width: 410.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
              ),
              child:  SvgPicture.asset(
                'assets/images/empty1.svg',
              ),
            ),
            SizedBox(height: 40.3.h,),
            Text(
              AppString.emptyBasket,
              style: Theme.of(context).textTheme.headlineLarge!.apply(fontSizeFactor: 1.sp),
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 268.w,
              child: Text(
                AppString.emptyBasketDes,
                style: Theme.of(context).textTheme.headlineSmall!.apply(fontSizeFactor: 1.sp),
              ),
            ),
            SizedBox(height: 80.3.h,),
            defaultMaterialButton(
              onPressed: ()
              {
                navigateTo(context, const BottomNavScreen(currentIndex: null,));
              },
              background: AppColors.myWhite,
              isUppercase: false,
              text: AppString.shopNow,
              textColor: AppColors.textBodyMediumColor,
              width: 240.w,
            ),
          ],
        ),
      ),
    );
  }
}
