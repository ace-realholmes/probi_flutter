import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PostScreenUpdate extends StatefulWidget {
  const PostScreenUpdate({super.key});

  @override
  State<PostScreenUpdate> createState() => _PostScreenUpdateState();
}

class _PostScreenUpdateState extends State<PostScreenUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              context.router.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.router.pushNamed("/post/draft");
                },
                icon: Icon(Icons.drafts, color: Colors.white,))
          ],
          title: Text('Update Post'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(hintText: "Title"),
                  minLines: 1,
                ),
                SizedBox(
                  height: 12,
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "Body"),
                  maxLines: 5,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.replaceNamed('/post/list');
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )));
  }
}
