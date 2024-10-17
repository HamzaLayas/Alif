class ServiceCategoryModel {
  String? sId;
  String? name;
  String? serviceType;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<String>? services;

  ServiceCategoryModel({
    this.sId,
    this.name,
    this.serviceType,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.services,
  });

  ServiceCategoryModel.fromMap(Map<String, dynamic> map) {
    sId = map['_id'];
    name = map['name'];
    serviceType = map['serviceType'];
    deletedAt = map['deletedAt'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
    // services = json['services'].cast<String>();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = sId;
    map['name'] = name;
    map['serviceType'] = serviceType;
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    // data['services'] = services;
    return map;
  }
}
