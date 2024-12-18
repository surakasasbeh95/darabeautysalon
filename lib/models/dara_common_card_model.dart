class DaraCommonCardModel {
  String image;
  String title;
  String? subtitle;
  String? rating;
  String? likes;
  String? comments;
  String? distance;
  bool saveTag;
  bool? liked;

  DaraCommonCardModel(
      {required this.image,
      required this.title,
      this.subtitle,
      this.comments,
      this.distance,
      this.likes,
      this.rating,
      required this.saveTag,
      this.liked});
}
