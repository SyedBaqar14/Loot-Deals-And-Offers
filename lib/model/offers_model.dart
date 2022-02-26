class LatestDealsModel {
  int? totalItems;
  String? status;
  String? message;
  List<Data>? data;

  LatestDealsModel({this.totalItems, this.status, this.message, this.data});

  LatestDealsModel.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? id;
  String? title;
  String? productId;
  String? code;
  String? slug;
  String? mrp;
  String? indexing;
  String? status;
  String? badge;
  String? imageUrls;
  String? image;
  String? imge;
  String? currency;
  String? price;
  String? marketRetailPrice;
  String? salePrice;
  String? url;
  String? logo;
  String? description;
  String? offers;
  String? type;
  String? random;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.productId,
        this.slug,
        this.mrp,
        this.imge,
        this.code,
        this.indexing,
        this.status,
        this.badge,
        this.imageUrls,
        this.image,
        this.currency,
        this.price,
        this.marketRetailPrice,
        this.salePrice,
        this.url,
        this.logo,
        this.description,
        this.offers,
        this.type,
        this.random,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    imge = json['imge'];
    productId = json['product_id'];
    slug = json['slug'];
    mrp = json['mrp'];
    indexing = json['indexing'];
    status = json['status'];
    badge = json['badge'];
    imageUrls = json['image_urls'];
    image = json['image'];
    currency = json['currency'];
    price = json['price'];
    marketRetailPrice = json['market_retail_price'];
    salePrice = json['sale_price'];
    url = json['url'];
    logo = json['logo'];
    description = json['description'];
    offers = json['offers'];
    type = json['type'];
    random = json['random'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
