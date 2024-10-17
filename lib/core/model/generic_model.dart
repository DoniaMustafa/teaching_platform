import 'package:flutter/cupertino.dart';

class GenericModel {
  int? id;
  String? title;
  String? subTitle;
  String? image; IconData? icon;
  String? role;
   VoidCallback? onTap;
  GenericModel({this.onTap,this.id,this.icon,this.role, this.title, this.subTitle, this.image});
}
