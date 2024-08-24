import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/colors.dart';
import 'views/calculator/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: CalculatorView(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0.0,
            shadowColor: AppColors.white,
            scrolledUnderElevation: 0,
          )
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
