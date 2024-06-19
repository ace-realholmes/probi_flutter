import 'package:flutter/material.dart';

import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/sample/services/blog.service.dart';
import 'package:probi_flutter/features/sample/models/post.model.dart';
import 'package:probi_flutter/features/sample/utils/validators.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

@RoutePage()
class SamplePostCreateScreen extends StatefulWidget {
  const SamplePostCreateScreen({super.key});

  @override
  State<SamplePostCreateScreen> createState() => _SamplePostCreateScreenState();
}

class _SamplePostCreateScreenState extends State<SamplePostCreateScreen> {
  /// Use `late` for later initialization, without late, context will not be accessible.
  late final postProvider = context.read<PostProvider>();

  /// Use global key to access form state. see `onSubmit` function.
  final formKey = GlobalKey<FormState>();

  final post = PostModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create A Post'),
      ),

      /// Use `SafeArea` widget to avoid system UI from interfering with the app UI.
      body: SafeArea(
        /// Use form to group fields for validation.
        child: Form(
          key: formKey,

          /// The whole form will be validated when the user input something on a single field.
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              /// Let stretchable widgets fill this Column's cross axis. E.g, TextFormFields
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text('Title')),
                  validator: Validators.title,
                  onChanged: (val) => post.title = val,
                  /// Alternatively, you can set validation behaviour for each field.
                  /// Validation will happen after the user input something.
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Body')),
                  onChanged: (val) => post.body = val,
                  validator: (val) => Validators.body(val, errorMsg: 'Custom body error'),

                  /// Alternatively, you can set validation behaviour for each field.
                  /// Validation will happen after the user input something.
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  /// Extra config
                  minLines: 2,
                  maxLines: 5,
                  maxLength: 600,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: onSubmit,
                  child: const Text('SUBMIT'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Create functions here. This way it's not mixed up with the UI codes.
  Future<void> onSubmit() async {
    /// Validate the form
    if (!formKey.currentState!.validate()) {
      return EasyLoading.showError('Form invalid!');
    }

    try {
      EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
      final created = await BlogService.publish(post);
      EasyLoading.showSuccess('Post Published!');
      Logger().i('Created: ${created.toJson()}');
    } catch (e) {
      EasyLoading.showToast('Failed to publish post');
      Logger().e('Error: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
