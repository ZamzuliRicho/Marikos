import 'package:flutter/material.dart';
import 'package:marikos/pages/splash_Screen.dart';
import 'package:marikos/providers/space_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: splashPage(),
      ),
    );
  }
}
