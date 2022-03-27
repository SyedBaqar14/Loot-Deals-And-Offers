class TrendingDetailsModel {
  String? status;
  String? message;
  Data? data;

  TrendingDetailsModel({this.status, this.message, this.data});

  TrendingDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? id;
  String? adminId;
  String? title;
  String? slug;
  String? mrp;
  String? price;
  String? url;
  String? imge;
  String? dscp;
  String? longDescription;
  String? icon;
  String? views;
  String? clicks;
  String? createdAt;

  Data(
      {this.id,
        this.adminId,
        this.title,
        this.slug,
        this.mrp,
        this.price,
        this.url,
        this.imge,
        this.dscp,
        this.longDescription,
        this.icon,
        this.views,
        this.clicks,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    title = json['title'];
    slug = json['slug'];
    mrp = json['mrp'];
    price = json['price'];
    url = json['url'];
    imge = json['imge'];
    dscp = json['dscp'];
    longDescription = json['long_description'];
    icon = json['icon'];
    views = json['views'];
    clicks = json['clicks'];
    createdAt = json['created_at'];
  }
}
