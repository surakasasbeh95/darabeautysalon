import 'package:darabeautysalon/models/dara_dashboard_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_appointment_model.dart';
import '../models/dara_comment_model.dart';
import '../models/dara_common_card_model.dart';
import '../models/dara_master_model.dart';
import '../models/dara_message_model.dart';
import '../models/dara_service_list_model.dart';
import '../models/dara_shopping_model.dart';

List<WalkThroughModelClass> getWalkThroughList() {
  List<WalkThroughModelClass> list = [];

  list.add(WalkThroughModelClass(
      image: 'images/welcome1.jpg',
      title:
          'Welcome to DARA world we provide many magic for you \n make up service ',
      subTitle: 'Beauty begins the moment you decide to be yourself.'));
  list.add(WalkThroughModelClass(
      image: 'images/welcome3.jpg',
      title: 'Hair Services',
      subTitle: 'Beauty comes from the inside. Inside the hair salon.'));
  list.add(WalkThroughModelClass(
      image: 'images/welcome4.jpg',
      title: 'Book nails care  anytime',
      subTitle: 'We cant change the world, but we can change your nails.'));

  list.add(WalkThroughModelClass(
      image: 'images/welcome2.png',
      title: 'Skin care',
      subTitle: 'Your skin care is Our-care.'));
  return list;
}

List<DaraDashboardModel> getDashboardList() {
  List<DaraDashboardModel> list = [];

  list.add(DaraDashboardModel(
      selectedIcon: 'images/home.png', unSelectedIcon: 'images/house.png'));
  list.add(DaraDashboardModel(
      selectedIcon: 'images/magnifier.png',
      unSelectedIcon: 'images/search.png'));
  list.add(DaraDashboardModel(
      selectedIcon: 'images/calendar_selected.png',
      unSelectedIcon: 'images/calendar.png'));
  list.add(DaraDashboardModel(
      selectedIcon: 'images/chat_selected.png',
      unSelectedIcon: 'images/chat.png'));
  list.add(DaraDashboardModel(
      selectedIcon: 'images/more_selected.png',
      unSelectedIcon: 'images/more.png'));

  return list;
}

List<DaraMasterModel> getMyMastersList() {
  List<DaraMasterModel> list = [];

  list.add(DaraMasterModel(
      image: 'images/banan.png',
      name: 'Banan kasasbeh',
      position: "Salon manager"));
  list.add(DaraMasterModel(
      image: 'images/face_one.png',
      name: 'Randa Reynolds',
      position: "Hair specialist"));
  list.add(DaraMasterModel(
      image: 'images/face_one.png',
      name: 'Krys qasem',
      position: "Nail technician"));

  list.add(DaraMasterModel(
      image: 'images/model_three.jpg',
      name: 'Hannah Benson',
      position: "Waxing specialist"));
  list.add(DaraMasterModel(
      image: 'images/model_three.jpg',
      name: 'Hannah Benson',
      position: "Colourist"));
  return list;
}

List<DaraServiceModel> getTopServicesHomeList() {
  List<DaraServiceModel> list = [];

  list.add(DaraServiceModel(image: 'images/salon.png', name: 'Hair Salon'));
  list.add(
      DaraServiceModel(image: 'images/nail-polish.png', name: 'Nail Salon'));
  list.add(DaraServiceModel(image: 'images/makeup.jpg', name: 'Beauty Salon'));
  list.add(DaraServiceModel(image: 'images/skincare.png', name: 'Skin care'));

  return list;
}

List<DaraCommonCardModel> getSpecialOffersList() {
  List<DaraCommonCardModel> list = [];

  list.add(DaraCommonCardModel(
    title: 'Fly Trim Hair Studio',
    image: 'images/salon_one.jpg',
    saveTag: true,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(DaraCommonCardModel(
    title: 'Paul Cuts',
    image: 'images/salon_two.jpg',
    saveTag: true,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '4.9',
    comments: '192 reviews',
    distance: '0.7 mil',
    liked: false,
  ));
  list.add(DaraCommonCardModel(
    title: 'Bio Pinky Nail Salon',
    image: 'images/salon_four.jpg',
    saveTag: true,
    subtitle: '1159w Madison street, 1, Chicago',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(DaraCommonCardModel(
    title: 'Savanna',
    image: 'images/salon_three.jpg',
    saveTag: true,
    subtitle: '2701 Black Rd, Joliet, II, 60435',
    rating: '4.8',
    comments: '1.2k reviews',
    distance: '0.5 mil',
    liked: false,
  ));
  list.shuffle();
  return list;
}

List<DaraCommonCardModel> getFavList() {
  List<DaraCommonCardModel> list = [];

  list.add(DaraCommonCardModel(
    title: 'Fly Trim Hair Studio',
    image: 'images/salon_one.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(DaraCommonCardModel(
    title: 'Paul Cuts',
    image: 'images/salon_two.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '4.9',
    comments: '192 reviews',
    distance: '0.7 mil',
    liked: true,
  ));
  list.add(DaraCommonCardModel(
    title: 'Bio Pinky Nail Salon',
    image: 'images/salon_four.jpg',
    saveTag: false,
    subtitle: '1159w Madison street, 1, Chicago',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
  ));
  list.add(DaraCommonCardModel(
    title: 'Savanna',
    image: 'images/salon_three.jpg',
    saveTag: false,
    subtitle: '2701 Black Rd, Joliet, II, 60435',
    rating: '4.8',
    comments: '1.2k reviews',
    distance: '0.5 mil',
    liked: true,
  ));

  list.shuffle();

  return list;
}

List<DaraCommonCardModel> getRecommendedList() {
  List<DaraCommonCardModel> list = [];

  list.add(DaraCommonCardModel(
    title: 'Hairs',
    image: 'images/hair.webp',
    saveTag: false,
    subtitle: '2701 Black Rd, Joliet, II, 60435',
    rating: '4.8',
    comments: '1.2k',
    distance: '0.5 mil',
    liked: false,
    likes: '124',
  ));
  list.add(DaraCommonCardModel(
    title: 'Bio Pinky Nail Salon',
    image: 'images/salon_four.jpg',
    saveTag: false,
    subtitle: '1159w Madison street, 1, Chicago',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
    likes: '23',
  ));

  list.add(DaraCommonCardModel(
    title: 'Fly Trim Hair Studio',
    image: 'images/salon_one.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '5.0',
    comments: '240',
    distance: '0.5 mil',
    liked: true,
    likes: '258',
  ));
  list.add(DaraCommonCardModel(
    title: 'Paul Cuts',
    image: 'images/salon_two.jpg',
    saveTag: false,
    subtitle: '131-18 Merrick Blvd, Jamaica,Ny 11434',
    rating: '4.9',
    comments: '192',
    distance: '0.7 mil',
    liked: false,
    likes: '501',
  ));

  return list;
}

List<DaraServiceListModel> getPopularServiceList() {
  List<DaraServiceListModel> list = [];

  list.add(DaraServiceListModel(
      name: 'Men\'s Hair cut', cost: '\$50.00', time: '1h'));
  list.add(DaraServiceListModel(
      name: 'Men\'s Hair cut with beard', cost: '\$45.00', time: '30min'));
  list.add(
      DaraServiceListModel(name: 'Glow Me Color', cost: '\$30.00', time: '1h'));

  return list;
}

List<DaraServiceListModel> getOtherServiceList() {
  List<DaraServiceListModel> list = [];

  list.add(DaraServiceListModel(
      name: 'Early Bird Special(text to schedule)',
      cost: '\$25.00',
      time: '35min'));
  list.add(DaraServiceListModel(
      name: 'Men\'s Hair cut with beard', cost: '\$18.00', time: '30min'));
  list.add(DaraServiceListModel(
      name: 'Kid\'s Haircut(12 & under)', cost: '\$12.00', time: '45min'));
  list.add(DaraServiceListModel(
      name: 'Full VIP Service', cost: '\$20.00', time: '30min'));
  list.add(DaraServiceListModel(
      name: 'Men\'s Hair cut', cost: '\$50.00', time: '15min'));
  list.add(DaraServiceListModel(
      name: 'Edge w/Beard trim beard', cost: '\$5.00', time: '30min'));

  return list;
}

List<DaraCommentModel> getCommentsList() {
  List<DaraCommentModel> list = [];

  list.add(DaraCommentModel(
      image: 'images/face_one.png',
      likes: '4',
      time: '3m',
      name: 'Donald Walters',
      message: 'Nice work, bro!',
      isSubComment: false,
      isLiked: false));
  list.add(DaraCommentModel(
      image: 'images/face_one.png',
      likes: '2',
      time: '3m',
      name: 'Roxie Love',
      message: 'How many time for this style?',
      isSubComment: false,
      isLiked: true));
  list.add(DaraCommentModel(
      image: 'images/face_one.png',
      likes: '2',
      time: '3m',
      name: 'Cotherine Guzman',
      message: '45 minutes. maybe.',
      isSubComment: true,
      isLiked: false));
  list.add(DaraCommentModel(
      image: 'images/face_one.png',
      likes: '4',
      time: '20m',
      name: 'Nwaye Akachi',
      message: 'Good work!',
      isSubComment: false,
      isLiked: false));
  list.add(DaraCommentModel(
      image: 'images/face_one.png',
      likes: '4',
      time: '2d',
      name: 'Cvita Dolwschall',
      message: 'Suite with me, let\'s go!',
      isSubComment: false,
      isLiked: false));

  return list;
}

List<DaraAppointmentModel> getAppointments() {
  List<DaraAppointmentModel> list = [];

  list.add(DaraAppointmentModel(
    image: 'images/face_one.png',
    time: '9:30 PM - 10.30 PM (1h)',
    isSelected: true,
    product: '1 product',
    salonName: 'PACHA\'S Luciano',
    service: 'Men\'s Hair cut',
  ));

  return list;
}

List<DaraAppointmentModel> getMoreAppointmentsList() {
  List<DaraAppointmentModel> list = [];

  list.add(DaraAppointmentModel(
    image: 'images/face_one.png',
    time: '9:30 PM - 10.30 PM (1h)',
    isSelected: false,
    product: '1 product',
    salonName: 'PACHA\'S Luciano',
    service: 'Men\'s Hair cut',
  ));
  list.add(DaraAppointmentModel(
    image: 'images/face_one.png',
    time: '14:30 PM - 15.30 PM',
    isSelected: false,
    product: '1 product',
    salonName: 'Uncle will Da Barber',
    service: 'Hair cut + Deluxe Beard/ Facial Service',
  ));

  return list;
}

List<DaraMessageModel> getActiveList() {
  List<DaraMessageModel> list = [];

  list.add(DaraMessageModel(
      image: 'images/face_one.png',
      name: 'Hannah Benson',
      message: 'Hello!',
      isActive: true,
      lastSeen: ''));
  list.add(DaraMessageModel(
      image: 'images/face_one.png',
      name: 'Harry Gardner',
      message: 'How can I help you?',
      isActive: true,
      lastSeen: ''));

  return list;
}

List<DaraMessageModel> getMessageList() {
  List<DaraMessageModel> list = [];

  list.add(DaraMessageModel(
      image: 'images/face_one.png',
      name: 'Hannah Benson',
      message: 'Hello!',
      isActive: true,
      lastSeen: ''));
  list.add(DaraMessageModel(
      image: 'images/face_one.png',
      name: 'Victor Pocheco',
      message: 'Do you want to confirm yor appointment?',
      isActive: false,
      lastSeen: 'today , at 11:30 am'));
  list.add(DaraMessageModel(
      image: 'images/model_three.jpg',
      name: 'Harry Gardner',
      message: 'How can I help you?',
      isActive: true,
      lastSeen: ''));

  return list;
}

List<DaraShoppingModel> getProductList() {
  List<DaraShoppingModel> list = [];

  list.add(DaraShoppingModel(
    name: 'Intensive Theraphy Choco Gotas Shine',
    image: 'images/product_one.jpg',
    cost: '\$35.00',
    isAdded: true,
    items: 1,
    mrp: '\$40.29',
    rate: '4.9',
    views: '(135)',
  ));
  list.add(DaraShoppingModel(
    name: 'Kiwi Skin boosterz',
    image: 'images/product_two.png',
    cost: '\$29.99',
    isAdded: false,
    items: 1,
    mrp: '\$35.00',
    rate: '4.9',
    views: '(240)',
  ));
  list.add(DaraShoppingModel(
    name: 'Intensive Theraphy Choco Gotas Shine',
    image: 'images/product_three.jpg',
    cost: '\$35.00',
    isAdded: false,
    items: 1,
    mrp: '\$40.29',
    rate: '4.9',
    views: '(135)',
  ));

  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
  ];
}

class PairValue {
  String id;
  String? parentId;
  String name;

  PairValue(this.id, this.name, {this.parentId});
}
