import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/features/post/models/post.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';
import 'package:probi_flutter/features/post/widgets/text_form_field.widget.dart';
import 'package:probi_flutter/features/sample/utils/validators.dart';
import 'package:provider/provider.dart';

import '../../../routing/app.router.gr.dart';

class PostAddBodyWidget extends StatelessWidget {
  PostAddBodyWidget({super.key});

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
                  decoration: const InputDecoration(label: Text('Title')),
                  controller: value.titleController,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(label: Text('Body')),
                  onChanged: (value) => post.body = value,
                  validator: (value) => Validators.body(value),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      /// Validate the form
                      if (!formKey.currentState!.validate()) {
                        return EasyLoading.showError('Form invalid!');
                      }

                      try {
                        EasyLoading.show(
                            status: "Loading",
                            maskType: EasyLoadingMaskType.black);
                        final created = await PostService().postPost(post);
                        EasyLoading.showSuccess('Post Published!');
                        Logger().i('Created: ${created.toJson()}');

                        context.router.navigate(const PostListRoute());
                      } catch (e) {
                        EasyLoading.showToast('Failed to publish post');
                        Logger().e('Error: $e');
                      } finally {
                        EasyLoading.dismiss();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
