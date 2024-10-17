class ServiceTypeModel {
  String? sId;
  String? name;
  String? image;
  String? description;
  List<String>? servicesCategories;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  ServiceTypeModel({
    this.sId,
    this.name,
    this.image,
    this.description,
    this.servicesCategories,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceTypeModel.fromMap(Map<String, dynamic> map) {
    return ServiceTypeModel(
      sId: map['_id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
      // if (map['servicesCategories'] !: null) {
      //   servicesCategories : <String>[],
      //   map['servicesCategories'].forEach((v) {
      //     servicesCategories!.add(new Null.frommap(v)),
      //   }),
      // }
      deletedAt: map['deletedAt'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = sId;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    // if (this.servicesCategories != null) {
    //   data['servicesCategories'] =
    //       this.servicesCategories!.map((v) => v.tomap()).toList();
    // }
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
