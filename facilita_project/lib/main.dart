import 'package:facilita_project/components/chart_container.dart';
import 'package:facilita_project/firebase_options.dart';
import 'package:facilita_project/pages/dashboard.dart';
import 'package:facilita_project/pages/login_page.dart';
import 'package:facilita_project/pages/cadastrar.dart';
import 'package:facilita_project/pages/extrato.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:facilita_project/widgets/auth_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facillita',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/extrato') {
          return MaterialPageRoute(
            builder: (context) =>
                const Extrato(), // Replace with your ExtratoPage
          );
        } else if (settings.name == '/cadastrar') {
          return MaterialPageRoute(
            builder: (context) =>
                const Cadastrar(), // Replace with your ExtratoPage
          );
        }
      },
      //home: Dashboard(),
      //home: Extrato(),
      //home: Cadastrar(),
      home: const AuthCheck(),
    );
  }
}
