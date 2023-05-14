import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../modules/webView.dart';

Widget item( article,context) => InkWell(
  onTap: () {
    navigateTo(
        context,
        webView(article['url'])
    );
  },
  child:   Padding(

  padding: const EdgeInsets.all(12.0),

  child: Row(

  crossAxisAlignment: CrossAxisAlignment.start,

  children: [

  Container(

  width: 130.0,

  height: 110.0,

  decoration: BoxDecoration(

  borderRadius: BorderRadius.circular(15.0),

  image: DecorationImage(

  image: NetworkImage('${article['urlToImage']}'),

  fit: BoxFit.cover

  ),

  ),

  ),

  SizedBox(

  width: 17.0,

  ),

  Expanded(

  child: Container(

    height: 105.0,

    child:   Column(



    mainAxisSize: MainAxisSize.min,



    crossAxisAlignment: CrossAxisAlignment.start,



    children: [



    Expanded(



    child: Text(

    '${article['title']}',

    style:

      Theme.of(context).textTheme.bodyText1,

      maxLines: 5,

      overflow: TextOverflow.ellipsis,



    ),



    ),

    SizedBox(

      height: 10.0,

    ),

    Text(



      '${article['publishedAt']}',



    style: TextStyle(



    fontWeight: FontWeight.w500,



    color: Colors.grey,



    ),



    ),



    ],



    ),

  ),

  )

  ],

  ),

  ),
);
Widget divider() => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Container(
    width: double.infinity,
    height: 2.0,
    color: Colors.black,
  ),
);
void navigateTo(context , Widget){
  Navigator.push(
      context, MaterialPageRoute(
      builder: (context) => Widget,
  )
  );
}
void navigateWithoutBack(context , Widget){
  Navigator.pushAndRemoveUntil(
      context,
    MaterialPageRoute(
    builder: (context) => Widget,
  ),
    (route) => false,
  );
}

Widget textForm({
  void Function(String value)? ontap,
  required TextEditingController control,
  required TextInputType textType,
  bool secure = false,
  required String Ltext,
  double r=0.0,
  required Icon pre,
  Icon? suffix,
  void Function(String)? onsubmit,
    FormFieldValidator<String>? valid,
  void Function()? show,
}) => TextFormField(
  controller: control,
  keyboardType: textType,
  obscureText: secure,
  decoration: InputDecoration(
    labelText: Ltext,
    labelStyle: TextStyle(
      color: Colors.grey,
      fontSize: 21.0
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey
      )
    ),

    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(r),
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid
            )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(r),
      borderSide: BorderSide(
        color:Colors.grey,
        style: BorderStyle.solid,
      ),
    ),
    prefixIcon: pre,
    suffixIcon: suffix != null? IconButton(
        icon: suffix,
        onPressed: show
    ) : null,
  ),
  onFieldSubmitted: onsubmit,
  validator: valid,
  onChanged: ontap,
  style: TextStyle(
    color: Colors.grey
  ),
  cursorColor: Colors.grey,
  //onChanged: (value) {},
);
Widget button({
  double width = double.infinity,
  Color color=Colors.black,
  double r=18.0,
  bool upper=true,
  required String text,
  required VoidCallback method,
}) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(r),
    color: color,
  ),
  width: width,
  child: MaterialButton(
    onPressed: method,
    child: Text(
      upper? text.toUpperCase(): text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
Future<bool?> showToast ({
  required String msg,
  required toastStates state
})=> Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseColortoast(state),
    textColor: Colors.white,
    fontSize: 20.0
);
enum toastStates {success , warning ,error}
Color? chooseColortoast (toastStates state){
  switch(state)
  {
    case toastStates.success :
    {
      return Colors.green;
    } break;
    case toastStates.warning :
      {
        return Colors.yellow;
      } break;
    case toastStates.error :
      {
        return Colors.red;
      } break;
  }
}