import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@unfreezed
class PostModel with _$PostModel{
  factory PostModel({
    int? userId,
    int? id,
    @Default('') String title,
    @Default('') String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}