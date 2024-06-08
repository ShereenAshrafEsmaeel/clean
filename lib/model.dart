import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  String? image;
  String? offername;
  String? price;
  String? area;
  String? hours;
  String? rate;

  OfferModel({
    required this.image,
    required this.offername,
    required this.price,
    required this.area,
    required this.hours,
    required this.rate,
  });

  OfferModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    image = json.data()['image'];
    offername = json.data()['offername'];
    price = json.data()['price'];
    area = json.data()['area'];
    hours = json.data()['hours'];
    rate = json.data()['rate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'offername': offername,
      'price': price,
      'area': area,
      'hours': hours,
      'rate': rate,
    };
  }
}
