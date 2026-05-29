import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/router/app_router.dart';
import 'core/utils/localization/logic/cubit/localization_cubit.dart';
import 'core/utils/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

class ChochoApp extends StatelessWidget {
  const ChochoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => getIt<LocalizationCubit>(),
        child: Builder(
          builder: (context) {
            final locale = context.select(
              (LocalizationCubit cubit) => cubit.state.langCode,
            );

            return MaterialApp.router(
              routerConfig: AppRouter.router,
              title: 'Chocho App',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              locale: Locale(locale),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
