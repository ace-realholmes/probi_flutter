import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import '../../../routing/app.router.gr.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:probi_flutter/features/post/models/post.dart';
import 'package:probi_flutter/features/sample/utils/validators.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';


class PostAddBodyWidget extends StatelessWidget {
  PostAddBodyWidget({super.key});

  final post = PostModel();
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              maxLines: 1,
              decoration:
                  const InputDecoration(label: Text('Title'), filled: true),
              controller: titleController,
              onChanged: (value) => post.title = value,
              validator: (value) => Validators.title(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 12),
            TextFormField(
              maxLines: 5,
              decoration:
                  const InputDecoration(label: Text('Body'), filled: true),
              onChanged: (value) => post.body = value,
              validator: (value) => Validators.body(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  final router = context.router;

                  /// Validate the form
                  if (!formKey.currentState!.validate()) {
                    return EasyLoading.showError('Form invalid!');
                  }

                  try {
                    
                    final created = await PostService.postPost(post);

                    Logger().i('Created: ${created.toJson()}');
                  } catch (e) {
                    throw Exception('Failed to Create Post');
                  }

                  // await value.createPost(post);

                  router.navigate(const PostListRoute());
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
