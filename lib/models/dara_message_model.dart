class DaraMessageModel {
  String image;
  String name;
  String? message;
  bool? isActive;
  String? lastSeen;

  DaraMessageModel(
      {required this.image,
      this.message,
      required this.name,
      this.isActive,
      this.lastSeen});
}
