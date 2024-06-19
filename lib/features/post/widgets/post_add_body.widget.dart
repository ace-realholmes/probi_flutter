import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/widgets/text_field.widget.dart';
import 'package:provider/provider.dart';

import '../../../routing/app.router.gr.dart';

class PostAddBodyWidget extends StatelessWidget {
  const PostAddBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFieldWidget(
                maxLines: 1,
                hint: "Title",
                controller: value.titleController,
                error: value.titleError,
              ),
              const SizedBox(height: 12),
              TextFieldWidget(
                maxLines: 5,
                hint: "Body",
                controller: value.bodyController,
                error: value.bodyError,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    bool isTitleEmpty = value.titleController.text.isEmpty;
                    bool isBodyEmpty = value.bodyController.text.isEmpty;

                    value.toggleTitleError(isTitleEmpty);
                    value.toggleBodyError(isBodyEmpty);

                    if (!isTitleEmpty && !isBodyEmpty) {
                      value.createPost();
                      value.titleController.clear();
                      value.bodyController.clear();
                      context.router.navigate(const PostRouteList());
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
