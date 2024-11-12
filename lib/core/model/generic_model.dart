import 'package:flutter/cupertino.dart';

class GenericModel {
  int? id;
  String? title;
  String? subTitle;bool? isSelected;
  String? image; IconData? icon;
  String? role;
   VoidCallback? onTap;
  GenericModel({this.onTap,this.id,this.isSelected,this.icon,this.role, this.title, this.subTitle, this.image});
}
