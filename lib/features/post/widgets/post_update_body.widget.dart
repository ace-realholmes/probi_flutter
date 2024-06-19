import '../models/post.dart';
import '../utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import '../../../routing/app.router.gr.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';


class PostUpdateBodyWidget extends StatelessWidget {
  PostUpdateBodyWidget({super.key, required this.id});

  final int id;
  final post = PostModel();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLines: 1,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                  controller: value.titleController,
                  onChanged: (value) => post.title = value,
                  validator: (value) => Validators.title(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(label: Text('Body')),
                  onChanged: (value) => post.body = value,
                  validator: (value) => Validators.body(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: value.bodyController,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return EasyLoading.showError('Form invalid!');
                      }
                      // bool isTitleEmpty = value.titleController.text.isEmpty;
                      // bool isBodyEmpty = value.bodyController.text.isEmpty;

                      // value.toggleTitleError(isTitleEmpty);
                      // value.toggleBodyError(isBodyEmpty);

                      // if (!isTitleEmpty && !isBodyEmpty) {
                      context.router.navigate(const PostListRoute());

                      post.id = id;
                      post.title = value.titleController.text;
                      post.body = value.bodyController.text;

                      await value.updatePost(post);
                    },
                    child: const Text(
                      'Submit',
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
