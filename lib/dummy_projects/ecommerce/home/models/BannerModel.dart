class BannerModel {
  BannerModel({
    this.status,
    this.message,
    this.data,
  });

  BannerModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BannerData.fromJson(v));
      });
    }
  }
  bool? status;
  dynamic message;
  List<BannerData>? data;
}

class BannerData {
  BannerData({
    this.id,
    this.image,
    this.category,
    this.product,
  });

  BannerData.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }
  num? id;
  String? image;
  dynamic category;
  dynamic product;
}
