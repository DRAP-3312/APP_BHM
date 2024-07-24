// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class Payment {
  int id_service;
  int id_users;
  int id_account;
  int amount;
  String reference;

  Payment({
    required this.id_service,
    required this.id_users,
    required this.id_account,
    required this.amount,
    required this.reference,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
