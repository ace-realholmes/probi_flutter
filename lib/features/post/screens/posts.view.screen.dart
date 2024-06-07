import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PostScreenView extends StatefulWidget {
  const PostScreenView({super.key});

  @override
  State<PostScreenView> createState() => _PostScreenViewState();
}

class _PostScreenViewState extends State<PostScreenView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post View'),
        leading: Icon(Icons.arrow_back, color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 12,),
                const Text(
                  'User #',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Expanded(child: SizedBox(height: 0,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, color: Colors.black,)),
                PopupMenuButton<String>(
                  // icon: Icon(Icons.menu, color: Colors.black,),
                  iconColor: Colors.black,
                  onSelected: (String result) {
                    if (result == 'update') {
                      context.router.pushNamed('/post/update');
                    } else if (result == 'delete') {
                      context.router.pushNamed('/post/list');
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'update',
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: Colors.blue),
                          SizedBox(width: 8), 
                          Text('Update'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ],
                ),
              
                
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec magna sem. Curabitur aliquam auctor hendrerit. Sed sed nisl in nunc euismod eleifend. Sed non '),
          ],
        ),
      ),
    );
  }
}
