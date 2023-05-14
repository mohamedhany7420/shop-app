import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/cupit/shop_cupit/ShopStates.dart';
import 'package:untitled9/cupit/shop_cupit/shopcubit.dart';

class products extends StatelessWidget {
  const products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, shopStates>
      (
        listener: (context, state) {},
        builder:  (context, state) {
          return ConditionalBuilder(
            condition: ShopLoginCubit.get(context).HomeModel != null,
            builder: (context) => showproducts(),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        }
    );
  }
}
Widget showproducts() => Column(
children: [

],
);
