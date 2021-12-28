import 'package:animation_hero_sample/screens/screen2.dart';
import 'package:flutter/material.dart';

class Item {
  final String title;
  final String urlImage;

  Item({required this.title, required this.urlImage});
}

class Screen1 extends StatelessWidget {
  final items = <Item>[
    Item(
        title: 'Item 1',
        urlImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb0Yw3T57OJfgYK1bPejUc2iMx09phtMy67w&usqp=CAU'),
    Item(
        title: 'Item 2',
        urlImage: 'https://www.python.jp/pages/python_logo2.png'),
    Item(
        title: 'Item 3',
        urlImage:
            'https://studycode.jp/wp-content/uploads/2019/04/java_logo.jpg'),
    Item(
        title: 'Item 4',
        urlImage: 'https://kitsune.blog/wp-content/uploads/ruby-logo.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Screen2(item: item)));
              },
              child: Container(
                height: 120,
                child: Card(
                  child: ListTile(
                    leading: Hero(
                        transitionOnUserGestures: true,
                        tag: item,
                        child: buildImage(item.urlImage)),
                    title: Text(
                      'Item ${index + 1}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget buildImage(String urlImage) => Image.network(
        urlImage,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );
}
