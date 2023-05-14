import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled9/components/components.dart';
import 'package:untitled9/cupit/shop_cupit/ShopStates.dart';
import 'package:untitled9/cupit/shop_cupit/shopcubit.dart';
import 'package:untitled9/models/shopLoginModel.dart';
import 'package:untitled9/modules/shopapp/shopLayout.dart';
import 'package:untitled9/network/remote/cachhelper.dart';


class ShopLogin extends StatelessWidget {
  @override
  var formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var pass = TextEditingController();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,shopStates>(
        listener: (context, state) {
          if(state is shopSuccessState) {
            if(state.LoginModel.status as bool)
            {
              print(state.LoginModel.data['token']);
              cashHelper.saveData(
                  key: 'token',
                  value:state.LoginModel.data['token']
              ).then((value){
                navigateWithoutBack(context, homepage());
              });

            }else
              {
                showToast(
                    msg: state.LoginModel.message as String,
                    state: toastStates.error
                );
              }
          }
          },
        builder: (context, state) {
          return Scaffold(
            appBar:AppBar(
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style:TextStyle(
                            color: Colors.blue,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        textForm(
                          control: email,
                          textType: TextInputType.emailAddress,
                          Ltext: 'Email Address',
                          pre: Icon(
                            Icons.email,
                          ),
                          valid: (value) {
                            if (value!.isEmpty)
                              return 'Please Enter Your Email Address';
                          },
                        ),
                        SizedBox(
                          height:15.0 ,
                        ),
                        textForm(
                          control: pass,
                          textType: TextInputType.visiblePassword,
                          Ltext: 'Password',
                          pre: Icon(
                            Icons.lock,
                          ),
                          secure: ShopLoginCubit.get(context).secure ,
                          suffix:ShopLoginCubit.get(context).suffix ,
                          show: () {
                            return ShopLoginCubit.get(context).changePassIcon();
                          },
                          valid: (value) {
                            if (value!.isEmpty)
                            return 'Enter your Password';
                          },
                          onsubmit: (p0) {
                            if(formkey.currentState!.validate()){
                              return ShopLoginCubit.get(context).user_login(
                                  email: email.text,
                                  pass: pass.text
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                            condition: state is! shopLoadingState,
                            builder: (context) {
                              return
                                button(
                                text: 'login',
                                method: () {
                                  if(formkey.currentState!.validate()){
                                    return ShopLoginCubit.get(context).user_login(
                                        email: email.text,
                                        pass: pass.text
                                    );
                                  }
                                  },
                                upper: true,
                                color: Colors.blue,
                              );
                            },
                            fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height:10.0 ,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black87,
                              ),
                            ),
                            TextButton(
                                onPressed:() {

                                },
                                child: Text(
                                  'Register'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
