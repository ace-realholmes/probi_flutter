import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 2.0,
      children: List.generate(data.length, (index) {
        return ListTile(
          title: Text("Data ${data[index]}"),
        );
      }),
    ));
  }
}
