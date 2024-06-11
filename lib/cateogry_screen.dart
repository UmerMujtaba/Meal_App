import 'package:flutter/material.dart';
import 'models/bottom_bar.dart';
import 'models/category.dart';
import 'models/drawer.dart';
import 'models/dummy_data.dart';
import 'models/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onCategorySelected(Category category) {
    if (category.id == 'c1')
    {
      Navigator.pushNamed(context, 'italian');
    }
    else if (category.id == 'c2')
    {
      Navigator.pushNamed(context, 'quick');
    }
    else if (category.id == 'c3')
    {
      Navigator.pushNamed(context, 'hamburger');
    }
    else if (category.id == 'c4')
    {
      Navigator.pushNamed(context, 'german');
    }
    else if (category.id == 'c5')
    {
      Navigator.pushNamed(context, 'light');
    }
    else if (category.id == 'c6')
    {
      Navigator.pushNamed(context, 'exotic');
    }
    else if (category.id == 'c7')
    {
      Navigator.pushNamed(context, 'breakfast');
    }
    else if(category.id == 'c8')
    {
      Navigator.pushNamed(context, 'asian');
    }
    else if(category.id == 'c9')
    {
      Navigator.pushNamed(context, 'french');
    }
    else
    {
      Navigator.pushNamed(context, 'summer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Category',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        // leading: Icon(
        //   Icons.menu,
        //   size: 25,
        //   color: Colors.white,
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: availableCategories.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 15.0,
              mainAxisExtent: 120),
          itemBuilder: (BuildContext context, int index) {
            final category = availableCategories[index];
            return CategoryItem(
              category,
              onPressed: () => onCategorySelected(category),
            );
          },
        ),
      ),
      drawer: const Draweer(
        title: 'ok',
      ),
      bottomNavigationBar: const BottomNavigationBarExample(),
    );
  }
}
