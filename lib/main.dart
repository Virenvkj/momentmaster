import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/di.dart';
import 'package:momentmaster/firebase_options.dart';
import 'package:momentmaster/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moment master',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      navigatorKey: getIt<NavigationService2>().navigatorKey2,
    );
  }
}
