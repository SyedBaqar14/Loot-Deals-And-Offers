class ProductDetailsModel {
  String? status;
  String? message;
  Data? data;

  ProductDetailsModel({this.status, this.message, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? id;
  String? title;
  String? productId;
  String? slug;
  String? indexing;
  String? status;
  String? badge;
  String? imageUrls;
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
        this.indexing,
        this.status,
        this.badge,
        this.imageUrls,
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
    productId = json['product_id'];
    slug = json['slug'];
    indexing = json['indexing'];
    status = json['status'];
    badge = json['badge'];
    imageUrls = json['image_urls'];
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
