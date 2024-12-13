class DaraCommentModel { 
  String image;
  String name;
  String message;
  String time;
  String likes;
  bool isSubComment;
  bool isLiked;

  DaraCommentModel(
      {required this.likes,
      required this.image,
      required this.time,
      required this.name,
      required this.message,
      required this.isSubComment,
      required this.isLiked});
}
