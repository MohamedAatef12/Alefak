import 'package:equatable/equatable.dart';

import '../../data/models/author_model.dart';

class PostEntity extends Equatable {
  final int id;
  final int authorID;
  final String text;
  final String username;
  final String date;
  final String imageUrl;
  final AuthorModel author;

  const PostEntity({
    required this.id,
    required this.authorID,
    required this.username,
    required this.text,
    required this.date,
    required this.imageUrl,
    required this.author,
  });

  @override
  List<Object?> get props =>
      [id, authorID, username, text, date, imageUrl, author];
}
