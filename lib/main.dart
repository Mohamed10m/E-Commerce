
import 'package:e_commerce/shared/helper/binding.dart';
import 'package:e_commerce/shared/style/theme.dart';
import 'package:e_commerce/view/control/controll_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: themeLite,
      darkTheme: themeDark,
      themeMode: ThemeMode.light,

      home: ControlView(),
    );
  }
}
