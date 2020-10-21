import 'package:flutter/material.dart';

class IPModel{
  String ip;
  String city;
  String region;
  String countryName;
  String org;

  IPModel({
    this.ip,
    this.city,
    this.region,
    this.countryName,
    this.org,
  });

  factory IPModel.fromJson(Map<String, dynamic> json){
    return IPModel(
      ip: json['ip'],
      city: json['city'],
      region: json['region'],
      countryName: json['countryName'],
      org: json['org'],
    );
  }
}