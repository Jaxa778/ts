import 'package:flutter/material.dart';
import 'package:ts/core/routes/app_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //  localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'TS App',
      routerConfig: AppRouter.router,
    );
  }
}
