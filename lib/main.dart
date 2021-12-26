import 'package:bloc_pattern/App_Routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakignBadApp(
    appRouter: AppRouter(),
  ));
}

class BreakignBadApp extends StatelessWidget {
  final AppRouter appRouter;

  const BreakignBadApp({Key? key,  required this.appRouter}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutes,
    );
  }
}
