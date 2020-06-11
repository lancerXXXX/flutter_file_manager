import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neofilemanager/Opertaion/Operation.dart';
import 'IOptButton.dart';

class RemoveFavOperation extends IOptButton{
  @override
  Color color=Colors.cyanAccent;
  @override
  String titleText='取消收藏';

  RemoveFavOperation(BuildContext context, FileSystemEntity file, int type) : super(context, file, type);

  @override
  void fun(FileSystemEntity file, int type) {
    new Operation(leftFiles, rightFiles, context).removeFavorite(file, type);
  }

}