class homeModel
{
  bool? status;
  homeDatamodel? data ;
  homeModel.fromJson( Map<String, dynamic> json)
  {
    status = json['status'];
    data =homeDatamodel.fromJson(json['data']);
  }
}
class homeDatamodel
{
  List<bannersModel> banners =[];
  List<productssModel> products=[];
homeDatamodel.fromJson(Map<String, dynamic>json)
{
json['banners'].forEach((element)
{
  banners.add(element);
});
json['products'].forEach((element)
{
  products.add(element);
});
}
}
class bannersModel
{
  int? id;
  String? image;
      bannersModel.fromJson(Map<String, dynamic>json)
      {
        id = json['id'];
        image = json[image];
      }
}

class productssModel
{
  int? id ;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorite ;
  bool? inCart;
  productssModel.fromJson(Map<String, dynamic>json)
  {
     id = json['id'] ;
     price= json['price'];
     oldprice=json['oldprice'];
     discount= json['discount'];
     image = json['image'];
     name = json['name'];
     inFavorite = json['in_favorites'];
     inCart = json['in_cart'];
  }
}
