class ServiceCategoryModel {
  String? sId;
  String? name;
  String? serviceType;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  ServiceCategoryModel({
    this.sId,
    this.name,
    this.serviceType,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceCategoryModel.fromMap(Map<String, dynamic> map) {
    return ServiceCategoryModel(
      sId: map['_id'],
      name: map['name'],
      serviceType: map['serviceType'],
      deletedAt:
          map['deletedAt'] == null ? null : DateTime.parse(map['deletedAt']),
      createdAt:
          map['createdAt'] == null ? null : DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] == null ? null : DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = sId;
    map['name'] = name;
    map['serviceType'] = serviceType;
    map['deletedAt'] = deletedAt?.toIso8601String();
    map['createdAt'] = createdAt?.toIso8601String();
    map['updatedAt'] = updatedAt?.toIso8601String();
    return map;
  }
}
