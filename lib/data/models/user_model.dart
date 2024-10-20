// ignore_for_file: must_be_immutable

import 'package:alif/data/models/wallet_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? image;
  WalletModel? wallet;
  List<String>? favorites;

  UserModel({
    this.sId,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.wallet,
    this.favorites,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      sId: map['sId'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      wallet: WalletModel.fromMap(map['wallet']),
      // favorites: map['favorites'],
    );
  }
  @override
  List<Object?> get props =>
      [sId, name, email, phone, image, wallet, favorites];
}
