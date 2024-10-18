class WalletModel {
  String? sId;
  String? user;
  int? balance;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  WalletModel({
    this.sId,
    this.user,
    this.balance,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      sId: map['sId'],
      user: map['user'],
      balance: map['balance'],
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
      'user': user,
      'balance': balance,
      'deletedAt': deletedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
