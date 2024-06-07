import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:probi_flutter/themes/default.themes.dart';

@RoutePage()
class PostScreenList extends StatefulWidget {
  const PostScreenList({super.key});

  @override
  State<PostScreenList> createState() => _PostScreenListState();
}

class _PostScreenListState extends State<PostScreenList> {
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

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.pushNamed('/post/add');
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Product List"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.list, color: Colors.white,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode_outlined, color: Colors.white,))
          ],
        ),
        body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: List.generate(data.length, (index) {
            return GestureDetector(
              onTap: () {
                context.router.pushNamed('/post/view');
              },
              child: Card(
                child: Column(
                  children: [
                    Text('Data ${data[index]}'),
                    Text(
                      'Lorem ipsum dol',
                      style: lightTheme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
