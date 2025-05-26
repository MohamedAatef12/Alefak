import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final int id;
  final String text;
  final int postID;
  final String date;

  const CommentEntity({
    required this.id,
    required this.text,
    required this.postID,
    required this.date,
  });

  @override
  List<Object?> get props => [id, text, postID, date];
}
