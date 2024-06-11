import 'package:flutter/material.dart';
import 'package:mealapp/screens/asian/detail_screen.dart';
import 'package:mealapp/screens/asian_screen.dart';
import 'package:mealapp/screens/breakfast/detail_screen.dart';
import 'package:mealapp/screens/breakfast_screen.dart';
import 'package:mealapp/screens/exotic/detail_screeen.dart';
import 'package:mealapp/screens/exotic_screen.dart';
import 'package:mealapp/screens/french/detail_screen.dart';
import 'package:mealapp/screens/french_screen.dart';
import 'package:mealapp/screens/german/details_screen.dart';
import 'package:mealapp/screens/german_screen.dart';
import 'package:mealapp/screens/hamburger/detail_screen.dart';
import 'package:mealapp/screens/hamburger_screen.dart';
import 'package:mealapp/screens/italian/detail_screen.dart';
import 'package:mealapp/screens/italian_screen.dart';
import 'package:mealapp/screens/light/detail_screen.dart';
import 'package:mealapp/screens/light_screen.dart';
import 'package:mealapp/screens/quick/detail_screen.dart';
import 'package:mealapp/screens/quick_screen.dart';
import 'package:mealapp/screens/summer/detail_screen.dart';
import 'package:mealapp/screens/summer_screen.dart';
import 'models/cateogry_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/first': (context) => const FirstScreen(),
        'italian':(context)=>const ItalianScreen(),
        'italian_detail':(context)=>const ItalianDetailScreen(),
        'quick':(context)=>const QuickScreen(),
        'quick_detail':(context)=>const QuickDetailScreen(),
        'hamburger':(context)=>const HamburgerScreen(),
        'hamburger_detail':(context)=>const HamburgerDetailScreen(),
        'german':(context)=>const GermanScreen(),
        'german_detail':(context)=>const GermanDetailScreen(),
        'light':(context)=>const LightScreen(),
        'light_detail':(context)=> const LightDetailScreen(),
        'exotic':(context)=>const ExoticScreen(),
        'exotic_detail':(context)=>const ExoticDetailScreen(),
        'breakfast':(context)=>const BreakfastScreen(),
        'breakfast_detail':(context)=>const BreakfastDetailScreen(),
        'asian':(context)=>const AsianScreen(),
        'asian_detail': (context)=>const AsianDetailScreen(),
        'french':(context)=>const FrenchScreen(),
        'french_detail':(context)=>const FrenchDetailScreen(),
        'summer':(context)=>const SummerScreen(),
        'summer_detail':(context)=>const SummerDetailScreen(),
      },
    );
  }
}
