import 'package:flutter/material.dart';

class SummerDetailScreen extends StatefulWidget {
  // final Meal meal;
  // required this.meal
  const SummerDetailScreen({ Key? key}) : super(key: key);

  @override
  State<SummerDetailScreen> createState() => _SummerDetailScreenState();
}

class _SummerDetailScreenState extends State<SummerDetailScreen> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          '',
          // meal.title,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {

              });
            },
            icon: const Icon(
              Icons.star_border,
              size: 26,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              "https://images.pexels.com/photos/7218637/pexels-photo-7218637.jpeg",
              width: double.infinity,
              height: 300,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.brown[300],
                fontSize: 26,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              //itemCount: meal!.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  // Reduce space between tiles
                  child: const ListTile(
                    dense: true,
                    title: Text(
                      '',
                      //meal!.ingredients[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Steps',
              style: TextStyle(
                color: Colors.brown[300],
                fontSize: 26,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              // itemCount: meal!.steps.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  // Reduce space between tiles
                  child: const ListTile(
                    dense: true,
                    title: Text(
                      '',
                      //meal!.steps[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
