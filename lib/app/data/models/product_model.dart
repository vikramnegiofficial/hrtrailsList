import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int? status;
  final String? msg;
  int? no_of_products;
  List<Result>? result = [];
  ProductModel({
    this.status,
    this.msg,
    this.no_of_products,
    this.result,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'msg': msg,
      'no_of_products': no_of_products,
      'result': result!.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      status: map['status'] != null ? map['status'] as int : null,
      msg: map['msg'] != null ? map['msg'] as String : null,
      no_of_products:
          map['no_of_products'] != null ? map['no_of_products'] as int : null,
      result: map['result'] != null
          ? List<Result>.from(
              (map['result'] as List<dynamic>).map<Result?>(
                (x) => Result.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Result {
  String? addedOn;
  int? moq;
  String? type;
  int? increaseQuantity;
  String? name;
  int? productNo;
  String? prodGroupId;
  int? mrp;
  String? quickProductCheck;
  int? txnQuantity;
  int? txnQuantity2;
  List<Rate>? rate;
  List<Rate>? notForSell;
  String? slug;
  String? slug2;
  int? ratings;
  Gallery? gallery;
  Result({
    this.addedOn,
    this.moq,
    this.type,
    this.increaseQuantity,
    this.name,
    this.productNo,
    this.prodGroupId,
    this.mrp,
    this.quickProductCheck,
    this.txnQuantity,
    this.txnQuantity2,
    this.rate,
    this.notForSell,
    this.slug,
    this.slug2,
    this.ratings,
    this.gallery,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addedOn': addedOn,
      'moq': moq,
      'type': type,
      'increaseQuantity': increaseQuantity,
      'name': name,
      'productNo': productNo,
      'prodGroupId': prodGroupId,
      'mrp': mrp,
      'quickProductCheck': quickProductCheck,
      'txnQuantity': txnQuantity,
      'txnQuantity2': txnQuantity2,
      'rate': rate!.map((x) => x.toMap()).toList(),
      'notForSell': notForSell!.map((x) => x.toMap()).toList(),
      'slug': slug,
      'slug2': slug2,
      'ratings': ratings,
      'gallery': gallery?.toMap(),
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      addedOn: map['addedOn'] != null ? map['addedOn'] as String : null,
      moq: map['moq'] != null ? map['moq'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
      increaseQuantity: map['increaseQuantity'] != null
          ? map['increaseQuantity'] as int
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      productNo: map['productNo'] != null ? map['productNo'] as int : null,
      prodGroupId:
          map['prodGroupId'] != null ? map['prodGroupId'] as String : null,
      mrp: map['mrp'] != null ? map['mrp'] as int : null,
      quickProductCheck: map['quickProductCheck'] != null
          ? map['quickProductCheck'] as String
          : null,
      txnQuantity:
          map['txnQuantity'] != null ? map['txnQuantity'] as int : null,
      txnQuantity2:
          map['txnQuantity2'] != null ? map['txnQuantity2'] as int : null,
      rate: map['rate'] != null
          ? List<Rate>.from(
              (map['rate'] as List<int>).map<Rate?>(
                (x) => Rate.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      notForSell: map['notForSell'] != null
          ? List<Rate>.from(
              (map['notForSell'] as List<int>).map<Rate?>(
                (x) => Rate.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      slug2: map['slug2'] != null ? map['slug2'] as String : null,
      ratings: map['ratings'] != null ? map['ratings'] as int : null,
      gallery: map['gallery'] != null
          ? Gallery.fromMap(map['gallery'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rate {
  int? id;
  int? productNo;
  int? rate_type;
  int? rate;
  double? discount_percent;
  int? add_by;
  String? add_on;
  String? is_member;
  String? is_active;
  int? company_num;
  String? name;
  int? is_rent;
  Rate({
    this.id,
    this.productNo,
    this.rate_type,
    this.rate,
    this.discount_percent,
    this.add_by,
    this.add_on,
    this.is_member,
    this.is_active,
    this.company_num,
    this.name,
    this.is_rent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_no': productNo,
      'rate_type': rate_type,
      'rate': rate,
      'discount_percent': discount_percent,
      'add_by': add_by,
      'add_on': add_on,
      'is_member': is_member,
      'is_active': is_active,
      'company_num': company_num,
      'name': name,
      'is_rent': is_rent,
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      id: map['id'],
      productNo: map['product_no'],
      rate_type: map['rate_type'],
      rate: map['rate'],
      discount_percent: map['discount_percent'],
      add_by: map['add_by'],
      add_on: map['add_on'],
      is_member: map['is_member'],
      is_active: map['is_active'],
      company_num: map['company_num'],
      name: map['name'],
      is_rent: map['is_rent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rate.fromJson(String source) =>
      Rate.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Gallery {
  final String? small_thumbnail_link;
  final String? medium_thumbnail_link;
  Gallery({
    this.small_thumbnail_link,
    this.medium_thumbnail_link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'small_thumbnail_link': small_thumbnail_link,
      'medium_thumbnail_link': medium_thumbnail_link,
    };
  }

  factory Gallery.fromMap(Map<String, dynamic> map) {
    return Gallery(
      small_thumbnail_link: map['small_thumbnail_link'] != null
          ? map['small_thumbnail_link'] as String
          : null,
      medium_thumbnail_link: map['medium_thumbnail_link'] != null
          ? map['medium_thumbnail_link'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gallery.fromJson(String source) =>
      Gallery.fromMap(json.decode(source) as Map<String, dynamic>);
}
