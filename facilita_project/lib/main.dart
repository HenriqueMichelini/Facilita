import 'package:facilita_project/components/chart_container.dart';
import 'package:facilita_project/firebase_options.dart';
import 'package:facilita_project/pages/dashboard.dart';
import 'package:facilita_project/pages/login_page.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facillita',
      home: Dashboard(),
      //home: AuthCheck(),
    );
  }
}
