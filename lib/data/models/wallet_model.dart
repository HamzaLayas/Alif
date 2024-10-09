class WalletModel {
  String? sId;
  String? user;
  int? balance;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  WalletModel({
    this.sId,
    this.user,
    this.balance,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'user': user,
      'balance': balance,
      'deletedAt': deletedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      sId: map['sId'],
      user: map['user'],
      balance: map['balance'],
      deletedAt: map['deletedAt'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }
}
