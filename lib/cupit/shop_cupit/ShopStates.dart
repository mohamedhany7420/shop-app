import 'package:untitled9/models/homeModel.dart';
import 'package:untitled9/models/shopLoginModel.dart';

abstract class shopStates {}
class shopLoginInitialState extends shopStates{}
class shopLoadingState extends shopStates{}
class shopSuccessState extends shopStates
{
shopLoginModel LoginModel;

shopSuccessState(this.LoginModel);
}
class shopFailedState extends shopStates
{
final String error;

  shopFailedState(this.error);

}
class changeIconState extends shopStates{}
class changebottomNavState extends shopStates{}
class HomeSuccessDataState extends shopStates
{
homeModel HomeModel;
HomeSuccessDataState(this.HomeModel);
}
class HomeErrorState extends shopStates {
  final String error;

  HomeErrorState(this.error);
}