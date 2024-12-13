class DaraAppointmentModel {
  String salonName;
  String service;
  String time;
  String product;
  String image;
  bool isSelected;

  DaraAppointmentModel(
      {required this.time,
      required this.image,
      required this.isSelected,
      required this.product,
      required this.salonName,
      required this.service});
}
