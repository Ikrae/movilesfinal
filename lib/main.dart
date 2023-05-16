import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:bibliobook/HomePage.dart';
import 'package:bibliobook/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'firebase_options.dart';

// Cambia la función main a una función async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa Firebase antes de ejecutar la aplicación
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: Splash(), // Cambio de HomePage a Splash
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => HomePage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
    );
  }
}
