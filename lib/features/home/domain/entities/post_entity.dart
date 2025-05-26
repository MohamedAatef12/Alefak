import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int id;
  final int authorID;
  final String text;
  final String username;
  final String date;
  final String imageUrl;

  const PostEntity({
    required this.id,
    required this.authorID,
    required this.username,
    required this.text,
    required this.date,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, authorID, username, text, date, imageUrl];
}
