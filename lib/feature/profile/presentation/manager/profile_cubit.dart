import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/const/constant.dart';
import '../../../../core/firebase_services/firestore_services.dart';
import '../../data/user_model.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.fireStoreService) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  FireStoreService fireStoreService;

  CollectionReference usserData =
  FirebaseFirestore.instance.collection("UsserData");

  UserModel? userModel;

  Future<dynamic> getProfile() async {
    try {
      emit(GetProfileLoading());
      await FirebaseFirestore.instance.collection("UsserData").doc(Constant.uid!)
          .get()

          .then((value) {
        userModel = UserModel.fromJson(
            value.data() as Map<String, dynamic>);

        emit(GetProfileSuccess());
      });
    } catch (error) {
      print(error.toString());
      emit(GetProfileError());
    }
  }


}