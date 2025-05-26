import 'package:alefk/features/home/domain/entities/comments_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.text,
    required super.postID,
    required super.date,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      text: json['text'],
      postID: json['postID'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'postID': postID,
      'date': date,
    };
  }

  CommentModel.fromEntity(CommentEntity commentEntity)
      : super(
          id: commentEntity.id,
          text: commentEntity.text,
          postID: commentEntity.postID,
          date: commentEntity.date,
        );

  CommentEntity toEntity(CommentModel commentModel) => CommentEntity(
        id: commentModel.id,
        text: commentModel.text,
        postID: commentModel.postID,
        date: commentModel.date,
      );
}
