import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trevalapp2/pages/detail_page.dart';
import 'package:trevalapp2/pages/login_page.dart';
import 'package:trevalapp2/pages/main_page.dart';
import 'package:trevalapp2/pages/register_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Route? onGenerate(settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case'/detail':
        if(arguments is int) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) =>  DetailPage(id: arguments),
          );
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: onGenerate,
      initialRoute: "/",
      routes: {
        '/': (context) => const MainPage(),
        '/main' : (context) => const MainPage(),
        '/login' : (context) =>  const LogInPage(),
        '/register' : (context) =>  const RegisterPage(),
      },


    );
  }
}
