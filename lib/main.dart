import 'package:flutter/material.dart';
import 'package:kast_test/utils/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoutes _appRoutes = AppRoutes();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kast test',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: _appRoutes.router,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
