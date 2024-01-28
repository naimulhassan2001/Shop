class CategoryProduct_Model {
  int? status;
  String? message;
  Data? data;

  CategoryProduct_Model({this.status, this.message, this.data});

  CategoryProduct_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  List<Attributes>? attributes;

  Data({this.type, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? sId;
  String? productName;
  String? productDescription;
  String? productImage;
  int? productPrice;
  String? categoryId;
  int? iV;

  Attributes(
      {this.sId,
        this.productName,
        this.productDescription,
        this.productImage,
        this.productPrice,
        this.categoryId,
        this.iV});

  Attributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    categoryId = json['categoryId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['productImage'] = this.productImage;
    data['productPrice'] = this.productPrice;
    data['categoryId'] = this.categoryId;
    data['__v'] = this.iV;
    return data;
  }
}
