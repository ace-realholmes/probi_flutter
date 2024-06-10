import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostScreenFavorites extends StatelessWidget {
  PostScreenFavorites({super.key});

  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            
            context.router.back();
          },
          color: Colors.white,
        ),
        title: const Text('Post Favorites'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(data[index].toString()),
              subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              trailing: Icon(Icons.favorite),
            );
          }),
    );
  }
}
