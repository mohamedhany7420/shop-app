import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/cupit/shop_cupit/ShopStates.dart';

import '../../cupit/shop_cupit/shopcubit.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit , shopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "amazon",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              body: ShopLoginCubit.get(context).screens[ShopLoginCubit.get(context).currentIndex] ,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: ShopLoginCubit.get(context).currentIndex,
                onTap: (index) =>ShopLoginCubit.get(context).changebottomNav(index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_sharp),
                      label: 'products',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: 'categories',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'settings',
                    )
                  ]
              ),
            );
          },
      ),
    );
  }
}
