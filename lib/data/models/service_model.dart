// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceModel {
  // Location? location;
  String? sId;
  String? name;
  String? desription;
  String? serviceCategories;
  List<String>? serviceDate;
  String? companyInfo;
  bool? isActive;
  String? address;
  int? price;
  int? discount;
  bool? isFeatured;
  bool? isSponsored;
  String? mainImage;
  List<String>? images;
  String? endDate;
  bool? isPermanent;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  ServiceModel({
    this.sId,
    this.name,
    this.desription,
    this.serviceCategories,
    this.serviceDate,
    this.companyInfo,
    this.isActive,
    this.address,
    this.price,
    this.discount,
    this.isFeatured,
    this.isSponsored,
    this.mainImage,
    this.images,
    this.endDate,
    this.isPermanent,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  ServiceModel.fromMap(Map<String, dynamic> map) {
    // location = json['location'] != null
    //     ? new Location.fromJson(json['location'])
    //     : null;
    sId = map['_id'];
    name = map['name'];
    desription = map['desription'];
    serviceCategories = map['serviceCategories'];
    serviceDate = map['serviceDate'].cast<String>();
    companyInfo = map['companyInfo'];
    isActive = map['isActive'];
    address = map['address'];
    price = map['price'];
    discount = map['discount'];
    isFeatured = map['isFeatured'];
    isSponsored = map['isSponsored'];
    mainImage = map['mainImage'];
    // if (json['images'] != null) {
    //   images = <String>[];
    //   json['images'].forEach((v) {
    //     images!.add(new String.fromJson(v));
    //   });
    // }
    endDate = map['endDate'];
    isPermanent = map['isPermanent'];
    deletedAt = map['deletedAt'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    // if (this.location != null) {
    //   data['location'] = this.location!.toJson();
    // }
    map['_id'] = sId;
    map['name'] = name;
    map['desription'] = desription;
    map['serviceCategories'] = serviceCategories;
    map['serviceDate'] = serviceDate;
    map['companyInfo'] = companyInfo;
    map['isActive'] = isActive;
    map['address'] = address;
    map['price'] = price;
    map['discount'] = discount;
    map['isFeatured'] = isFeatured;
    map['isSponsored'] = isSponsored;
    map['mainImage'] = mainImage;
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    map['endDate'] = endDate;
    map['isPermanent'] = isPermanent;
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
