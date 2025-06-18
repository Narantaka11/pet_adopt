import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adopt/pages/cart/cart.dart';
import 'package:pet_adopt/pages/payment/payment_page.dart';
import 'package:pet_adopt/pages/profile/editprofilepage.dart';
import 'package:pet_adopt/pages/tracking/tracking_page.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'pages/home_page/homeScreen.dart';
import 'pages/custom_drawer/drawScreen.dart';
import 'pages/login/login_page.dart';
import 'pages/login/start_page.dart';
import 'pages/login/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Atur status bar dan orientasi
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimalCategoryBottomModel()),
        ChangeNotifierProvider(create: (_) => AnimalSelectedModel()),
        ChangeNotifierProvider(create: (_) => DrawerOptionModel()),
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
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MainAppLayout(),
        '/cart': (context) => const CartPage(),
        '/payment': (context) => const PaymentPage(),
        '/tracking': (context) => const TrackingPage(),
        '/profile': (context) => const EditProfilePage(),
      },
    );
  }
}

// Layout utama setelah login: berisi drawer + halaman utama
class MainAppLayout extends StatelessWidget {
  const MainAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
