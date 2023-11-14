import 'package:expense_app/pages/avatar_picker.dart';
import 'package:expense_app/pages/home.dart';
import 'package:expense_app/pages/login.dart';
import 'package:expense_app/pages/new_category.dart';
import 'package:expense_app/pages/onboarding_username.dart';
import 'package:expense_app/pages/splash.dart';
import 'package:expense_app/store/avatar_store.dart';
import 'package:expense_app/store/category_store.dart';
import 'package:expense_app/store/expense_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ExpenseStore()),
          ChangeNotifierProvider(create: (context) => CategoryStore()),
          ChangeNotifierProvider(create: (context) => UserStore()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              textTheme: TextTheme(
            // Headings
            titleLarge:
                GoogleFonts.asap(fontSize: 35, fontWeight: FontWeight.w600),
            titleSmall:
                GoogleFonts.asap(fontSize: 25, fontWeight: FontWeight.w600),
            bodyLarge:
                GoogleFonts.asap(fontSize: 20, fontWeight: FontWeight.w600),
            bodyMedium:
                GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w600),
            bodySmall:
                GoogleFonts.jost(fontSize: 14, fontWeight: FontWeight.w600),
            labelMedium:
                GoogleFonts.jost(fontSize: 12, fontWeight: FontWeight.w600),
            labelSmall:
                GoogleFonts.jost(fontSize: 10, fontWeight: FontWeight.w600),
          )),
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/onboarding_username': (context) => const OnboardingUsername(),
            '/avatar_picker': (context) => const AvatarPicker(),
            '/login': (context) => const Login(),
            '/home': (context) => const Home(),
            '/new_category': (context) => const NewCategory(),
          },
        ));
  }
}
