// ignore_for_file: public_member_api_docs, sort_constructors_first
final mockComments = [
  CommentsMovieModel(
    name: 'Alice',
    comment: 'This is really helpful, thanks!',
    likes: 12,
    dislikes: 1,
  ),
  CommentsMovieModel(
    name: 'Bob',
    comment: 'I think this could be improved with more examples.',
    likes: 5,
    dislikes: 3,
  ),
  CommentsMovieModel(
    name: 'Charlie',
    comment: 'Amazing explanation, very clear!',
    likes: 20,
    dislikes: 0,
  ),
  CommentsMovieModel(
    name: 'Diana',
    comment: 'Not sure I completely agree, but interesting point.',
    likes: 8,
    dislikes: 4,
  ),
  CommentsMovieModel(
    name: 'Eve',
    comment: 'Can you share the source code?',
    likes: 10,
    dislikes: 2,
  ),
  CommentsMovieModel(
    name: 'Everyone',
    comment: 'Yes, u can Hire Him, He´s a good Web and Mobile developer',
    likes: 100,
    dislikes: -1,
  ),
];


class CommentsMovieModel {
    final String name;
  final String comment;
  final int likes;
  final int dislikes;
  CommentsMovieModel({
    required this.name,
    required this.comment,
    required this.likes,
    required this.dislikes,
  });
}
