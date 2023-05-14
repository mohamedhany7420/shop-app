 import 'package:shared_preferences/shared_preferences.dart';

class cashHelper{
 static SharedPreferences sharedpreferences = cashHelper.sharedpreferences;
 static init () async
 {
  sharedpreferences= await SharedPreferences.getInstance();
 }
 static Future<bool> putBool({required String key, required bool value}) async{
  return await sharedpreferences.setBool(key, value);
 }
static dynamic get({required String key}) {
  return  sharedpreferences.get(key);
 }
static Future<dynamic> saveData({
 required String key,
  required dynamic value
})async{
  if (value is String) return await sharedpreferences.setString(key, value);
  if (value is bool) return await sharedpreferences.setBool(key, value);
  if (value is int ) return await sharedpreferences.setInt(key, value);

  return await sharedpreferences.setDouble(key, value);

 }
 Future<bool> removeData ({
  required String key
})async{
   return await sharedpreferences.remove(key);
 }
}