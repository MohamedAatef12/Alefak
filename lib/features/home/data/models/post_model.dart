import 'package:alefk/features/home/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.authorID,
    required super.text,
    required super.username,
    required super.date,
    required super.imageUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      authorID: json['authorID'] as int,
      username: json['username'] as String,
      text: json['text'] as String,
      date: json['date'] as String,
      imageUrl: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorID': authorID,
      'username': username,
      'text': text,
      'date': date,
      'image': imageUrl,
    };
  }

  PostModel.fromEntity(PostEntity postEntity)
      : super(
          id: postEntity.id,
          authorID: postEntity.authorID,
          username: postEntity.username,
          text: postEntity.text,
          date: postEntity.date,
          imageUrl: postEntity.imageUrl,
        );

  PostEntity toEntity(PostModel postModel) => PostEntity(
        id: postModel.id,
        authorID: postModel.authorID,
        username: postModel.username,
        text: postModel.text,
        date: postModel.date,
        imageUrl: postModel.imageUrl,
      );
}
