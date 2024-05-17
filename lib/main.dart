import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/utils/constants/constants.dart';
import 'package:weather/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            textTheme: Typography.englishLike2014,
            iconTheme: IconThemeData(color: white),
            fontFamily: 'Poppins',
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          debugShowCheckedModeBanner: false,
          home:child,
        );
      },
      child: const HomePage(),
    );
  }
}
