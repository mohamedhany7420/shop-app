class shopLoginModel
{
   bool? status;
   String? message;
   dynamic data ;
  shopLoginModel.fromJson( Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data =json['data'];
  }
}
class userData
{
   int? id;
   String?

   name;
   String? email;
   String? phone;
   String? image;
   int? points;
   int? credit;
   String? token;
//named constructor
userData.fromJson( Map<String, dynamic> json)
{
  id = json['id'];
  name = json['name'];
  email = json['email'];
  phone = json['phone'];
  image = json['image'];
  points = json['points'];
  credit = json['credit'];
  token = json['token'];
}
}

