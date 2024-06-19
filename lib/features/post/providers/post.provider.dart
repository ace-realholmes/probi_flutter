import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import '../models/post.dart';
import '../services/post.service.dart';

/// Provider for managing posts in the application.
///
/// This class handles the retrieval, storage, creation, and deletion of posts,
/// and also manages favorite posts and drafts. It notifies listeners when there
/// are updates.
class PostProvider extends ChangeNotifier {
  /// Controller for the title text field.
  TextEditingController titleController = TextEditingController();

  /// Controller for the body text field.
  TextEditingController bodyController = TextEditingController();

  /// List of all posts.
  List<PostModel> posts = [];

  /// List of IDs for favorite posts.
  List<int> favoritePostIds = [];

  // Data structures for storing posts and drafts
  List<int> userIds = [];
  List<int> postIds = [];
  List<String> titles = [];
  List<String> bodies = [];
  List<String> draftTitles = [];
  List<String> draftBodies = [];
  List<int> draftPosts = [];

  // Error messages for validation
  String? titleError;
  String? bodyError;

  /// Secure storage instance for persistent storage.
  final secureStorage = const FlutterSecureStorage();

  /// Creates an instance of `PostProvider`.
  ///
  /// Automatically retrieves all posts and restores posts from storage.
  PostProvider() {
    getAllPosts();
    retrievePostFromStorage();
  }

  /// Fetches all posts from the API and stores them locally.
  ///
  /// Displays a loading indicator during the operation and notifies listeners
  /// when the posts are fetched.
  Future<void> getAllPosts() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    posts = await PostApi().getAllPosts();
    storePost(posts);
    EasyLoading.dismiss();
    notifyListeners();
  }

  /// Retrieves posts from secure storage.
  ///
  /// Reads the stored posts data from secure storage and updates the lists of
  /// titles, bodies, post IDs, and user IDs.
  Future<void> retrievePostFromStorage() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    final dataString = await secureStorage.read(key: 'probi_posts');
    if (dataString != null) {
      final data = jsonDecode(dataString);
      titles.clear();
      bodies.clear();
      postIds.clear();
      userIds.clear();
      postIds.addAll(data['postIds'] as List<int>);
      userIds.addAll(data['userIds'] as List<int>);
      titles.addAll(data['titles'] as List<String>);
      bodies.addAll(data['bodies'] as List<String>);
    }
    EasyLoading.dismiss();
  }

  /// Validates the title text field.
  ///
  /// Sets the `titleError` message if the title is empty and notifies listeners.
  void toggleTitleError(bool isEmpty) {
    if (isEmpty) {
      titleError = "Title cannot be empty";
    } else {
      titleError = null;
    }
    notifyListeners();
  }

  /// Validates the body text field.
  ///
  /// Sets the `bodyError` message if the body is empty and notifies listeners.
  void toggleBodyError(bool isEmpty) {
    if (isEmpty) {
      bodyError = "Body cannot be empty";
    } else {
      bodyError = null;
    }
    notifyListeners();
  }

  /// Toggles the favorite status of a post by its ID.
  ///
  /// Adds the post ID to the list of favorite post IDs if it's not present;
  /// removes it otherwise. Notifies listeners of the change.
  toggleFavoritePost(int id) async {
    if (favoritePostIds.contains(id)) {
      favoritePostIds.remove(id);
    } else {
      favoritePostIds.add(id);
    }
    notifyListeners();
  }

  /// Returns a list of favorite posts.
  ///
  /// Filters the `posts` list to include only posts whose IDs are in the
  /// `favoritePostIds` list.
  List<PostModel> get favoritePostList =>
      posts.where((post) => favoritePostIds.contains(post.id)).toList();

  /// Creates a new post using the API.
  ///
  /// Uses the text from `titleController` and `bodyController` to create the post.
  /// If successful, clears the text fields and fetches all posts again.
  Future<void> createPost() async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    PostModel post =
        await PostApi().postPost(titleController.text, bodyController.text);
    Logger().d("Create Post Provider: $post");

    getAllPosts();
    titleController.clear();
    bodyController.clear();

    EasyLoading.showSuccess('Post Successfully Added',
        duration: const Duration(milliseconds: 1200));
  }

  /// Stores the list of posts in secure storage.
  ///
  /// Saves the post IDs, user IDs, titles, and bodies in secure storage
  /// as a JSON-encoded string.
  Future<void> storePost(List<PostModel> posts) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    for (var post in posts) {
      postIds.add(post.id!);
      userIds.add(post.userId!);
      titles.add(post.title);
      bodies.add(post.body);
    }

    await secureStorage.write(
        key: "probi_posts",
        value: jsonEncode({
          "postIds": postIds,
          "userIds": userIds,
          "titles": titles,
          "bodies": bodies,
        }));

    Logger().i(
        "Store Post\nPost Id: $postIds\nUser Id: $userIds\nTitles: $titles\nBody: $bodies");

    EasyLoading.dismiss();
  }

  /// Stores a draft of the current post.
  ///
  /// If both the title and body are not empty, adds them to the draft lists
  /// and clears the text fields.
  storeDraft() {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    bool isTitleEmpty = titleController.text.isEmpty;
    bool isBodyEmpty = bodyController.text.isEmpty;

    if (!isTitleEmpty && !isBodyEmpty) {
      draftTitles.add(titleController.text);
      draftBodies.add(bodyController.text);
    }

    titleController.clear();
    bodyController.clear();
    EasyLoading.dismiss();
  }

  /// Edits a draft post by its index.
  ///
  /// Sets the text controllers to the draft content at the specified index
  /// and removes the draft from the lists.
  Future<void> editDraftPost(int index) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    titleController.text = draftTitles[index];
    bodyController.text = draftBodies[index];

    draftTitles.removeAt(index);
    draftBodies.removeAt(index);
    EasyLoading.dismiss();
    notifyListeners();
  }

  /// Prepares the post data for updating by its ID.
  ///
  /// Sets the text controllers to the title and body of the post with the
  /// specified ID and notifies listeners.
  Future<void> toUpdatePost(int id) async {
    for (var post in posts) {
      if (post.id == id) {
        titleController.text = post.title;
        bodyController.text = post.body;
        notifyListeners();
        break;
      }
    }
  }

  /// Updates a post using the API by its ID.
  ///
  /// If the update is successful, fetches all posts again and clears the text
  /// fields.
  Future<void> updatePost(int id) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    PostModel post = await PostApi().patchPost(id);
    Logger().d("Update Post Provider: $post");

    if (post.userId.toString().isNotEmpty || post.id.toString().isNotEmpty) {
      getAllPosts();
      titleController.clear();
      bodyController.clear();
    }
    EasyLoading.dismiss();
  }

  /// Deletes a post by its ID using the API.
  ///
  /// Notifies listeners after the post is deleted.
  Future<void> deletePost(int id) async {
    EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.black);
    await PostApi().deletePost(id);
    EasyLoading.dismiss();
    notifyListeners();
  }
}
