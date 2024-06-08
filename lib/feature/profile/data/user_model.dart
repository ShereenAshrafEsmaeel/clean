import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? location;
  String? password;
  //String? year;
  //String? month;
  //String? day;
  //String? type;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.location,
    required this.password,
   // required this.year,
    //required this.month,
    //required this.day,
    //required this.type,
  });

  UserModel.fromJson(Map<String, dynamic> json) {

    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    password = json['password'];
   // year = json['year'];
    //month = json['month'];
    //day = json['day'];
    //type = json['type'];
  }

  Map<String, dynamic> toJson() {
    return {

      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'location': location,
      'password': password,
     // 'year': year,
      //'month': month,
      //'day': day,
      //'type': type,
    };
  }
}
