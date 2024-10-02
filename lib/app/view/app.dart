import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:royal/core/bloc_initializers.dart';

import '../../core/route/route_import.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocInitializers(
      child:GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          final manager = FocusManager.instance;
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
            manager.primaryFocus?.unfocus();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: MaterialApp.router(
          scrollBehavior: AppScrollBehavior(),
          title: 'Royal',
          debugShowCheckedModeBanner: false,
          routerConfig:  AppRouter().router,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          ),
        ),
      ),
    );
  }
}
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
