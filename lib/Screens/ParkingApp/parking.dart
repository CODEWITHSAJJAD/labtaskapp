import 'package:flutter/material.dart';

class ParkingModel{
  String name;
  Icon icn;
  ParkingModel({required this.name,required this.icn});
  static List<ParkingModel> parkingModel=[];
}