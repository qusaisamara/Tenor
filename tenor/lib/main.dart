import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tenor/modules/tenor/tenor_view/tenor_Screen/tenor_view.dart';

import 'modules/tenor/tenor_binding/tenor_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: TenorBindings(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const TenorView(),
          );
        });
  }
}
