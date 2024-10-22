// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceDate {
  String? sId;
  DateTime? date;
  String? service;
  int? limit;
  int? count;
  bool? isFull;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceDate({
    required this.sId,
    required this.date,
    required this.service,
    required this.limit,
    required this.count,
    required this.isFull,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceDate.fromMap(Map<String, dynamic> map) {
    return ServiceDate(
      sId: map['sId'],
      date: map['date'] == null ? null : DateTime.parse(map['date']),
      service: map['service'],
      limit: map['limit'],
      count: map['count'],
      isFull: map['isFull'],
      deletedAt:
          map['deletedAt'] == null ? null : DateTime.parse(map['deletedAt']),
      createdAt:
          map['createdAt'] == null ? null : DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] == null ? null : DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'date': date,
      'service': service,
      'limit': limit,
      'count': count,
      'isFull': isFull,
      'deletedAt': deletedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
