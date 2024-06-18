import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.model.freezed.dart';
part 'post.model.g.dart';

@unfreezed
class PostModel with _$PostModel {
  factory PostModel({
    int? userId,
    int? id,
    @Default('') String title,
    @Default('') String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
