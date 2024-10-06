import 'package:flutter/cupertino.dart';

class GenericModel {
  int? id;
  String? title;
  String? subTitle;
  String? image;
  String? role;
VoidCallback? onTap;
  GenericModel({this.onTap,this.id,this.role, this.title, this.subTitle, this.image});
}
