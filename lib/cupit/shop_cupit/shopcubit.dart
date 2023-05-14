import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/constants/constants.dart';
import 'package:untitled9/cupit/shop_cupit/ShopStates.dart';
import 'package:untitled9/models/homeModel.dart';
import 'package:untitled9/models/shopLoginModel.dart';
import 'package:untitled9/modules/shopapp/screens/Products.dart';
import 'package:untitled9/modules/shopapp/screens/categories.dart';
import 'package:untitled9/modules/shopapp/screens/favourites.dart';
import 'package:untitled9/network/endPoints.dart';
import 'package:untitled9/network/remote/diohelper.dart';

import '../../modules/shopapp/screens/settings.dart';


class ShopLoginCubit extends Cubit<shopStates> {
  ShopLoginCubit() : super(shopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  shopLoginModel? LoginModel;

  void user_login({
    required String email, required String pass
  }) {
    emit(shopLoadingState());
    DioHelber.PostData(
        url: Login,
        data:
        {
          'email': email,
          'password': pass,
        }
    ).then((value) {
      LoginModel = shopLoginModel.fromJson(value.data);
      print(LoginModel!.status);
      emit(shopSuccessState(LoginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(shopFailedState(error.toString()));
    });
  }

  Icon suffix = Icon(Icons.visibility);
  bool secure = true;

  void changePassIcon() {
    secure = !secure;
    suffix = secure ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
    emit(changeIconState());
  }

  int currentIndex = 0;
  List<Widget> screens = [
    products(),
    categories(),
    favourites(),
    settings(),
  ];

  void changebottomNav(int index) {
    currentIndex = index;
    emit(changebottomNavState());
  }

  homeModel? HomeModel;
  void getHomeData() {
    emit(shopLoadingState());
    DioHelber.GetData(
        url: Home,
       Token: token
    ).then((value) {
      HomeModel = homeModel.fromJson(value.data);
      print(HomeModel!.data?.banners[0].image.toString());
      print(HomeModel!.status);
      emit(HomeSuccessDataState(HomeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState(error));
    });
  }
}