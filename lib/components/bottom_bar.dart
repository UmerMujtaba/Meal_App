// import 'package:flutter/material.dart';
// import 'package:mealapp/data/category.dart';
// import 'package:mealapp/data/meal.dart';
// import 'package:mealapp/screens/favorite_screen.dart';
// import 'package:mealapp/screens/meal_screen.dart';
// import '../components/drawer.dart';
//
// class BottomBar extends StatefulWidget {
//   final Meal meal;
//   final Category category;
//
//   const BottomBar({
//     Key? key,
//     required this.meal,
//     required this.category,
//   }) : super(key: key);
//
//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }
//
// class _BottomBarState extends State<BottomBar> {
//   int _selectedTabIndex = 0;
//   late List<Widget> screens;
//
//   @override
//   void initState() {
//     super.initState();
//     screens = [
//       MealScreen(category: widget.category, meal: widget.meal),
//       const FavoriteScreen(),
//       const Draweer(title: 'ok'),
//     ];
//   }
//
//   void _onTabTapped(int index) {
//     setState(() {
//       _selectedTabIndex = index;
//     });
//
//     if (index == 1) {
//       Navigator.pushNamed(context, '/favorite'); // Replace '/first' with your route name for FavoriteScreen
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       child: Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           elevation: 8,
//           iconSize: 24,
//           backgroundColor: Colors.black,
//           selectedIconTheme:
//           const IconThemeData(color: Colors.blueAccent, size: 28),
//           selectedItemColor: Colors.blueAccent,
//           unselectedIconTheme: const IconThemeData(color: Colors.grey),
//           unselectedItemColor: Colors.white,
//           currentIndex: _selectedTabIndex,
//           onTap: _onTabTapped,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.category),
//               label: 'Category',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.star),
//               label: 'Favorites',
//             ),
//           ],
//         ),
//         drawer: const Draweer(title: 'ok'),
//         body: IndexedStack(
//           index: _selectedTabIndex,
//           children: screens,
//         ),
//       ),
//     );
//   }
// }