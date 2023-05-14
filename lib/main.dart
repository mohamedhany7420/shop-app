import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/modules/shopapp/loginSHopApp.dart';
import 'package:untitled9/modules/shopapp/onBoarding.dart';
import 'package:untitled9/modules/shopapp/shopLayout.dart';
import 'package:untitled9/network/remote/cachhelper.dart';
import 'package:untitled9/network/remote/diohelper.dart';

import 'components/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelber.init();
  await cashHelper.init();
  bool? isdark = cashHelper.get(key: 'isdark');
  bool? onboarding = cashHelper.get(key: 'onBoarding');
  String? token= cashHelper.get(key: 'token');
  Widget openingScreen;
  if (onboarding != null)
  {
   if (token != null)
     openingScreen = homepage();
   else
     openingScreen = ShopLogin();
  }
  else{
    openingScreen = OnBoarding();
  }
  runApp( MyApp(
      isdark?? true,
      openingScreen
  ));
}

class MyApp extends StatelessWidget {

   final bool isdark;
   final Widget openinigScreen;

    MyApp(
      this.isdark,
      this.openinigScreen
    );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: openinigScreen,
    );
  }
}
