import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/router/app_router.dart';

class ChochoApp extends StatelessWidget {
  const ChochoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Chocho App',
        theme: ThemeData(primarySwatch: Colors.purple),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
