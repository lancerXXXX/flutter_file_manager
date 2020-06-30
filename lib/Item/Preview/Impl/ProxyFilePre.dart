import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neofilemanager/Item/Common.dart';
import 'package:neofilemanager/Item/Preview/FilePre.dart';
import 'package:neofilemanager/Item/Preview/Impl/RealFilePre.dart';

class ProxyFilePre extends FilePre {
  Common common;
  FileSystemEntity file;
  String extension;
  double iconHeight = 30.0;
  double iconWidth = 30.0;
  double fileHeight = 50.0;
  double fileWidth = 70.0;
  RealFilePre realFilePre;

  ProxyFilePre(
      this.common, this.file, this.extension, this.fileHeight, this.fileWidth);

  Widget build(BuildContext context) {
    // 对加载情况进行判断,如果加载完成才展示图片,否则展示一个小的代理图片
    return FutureBuilder(
      future: returnRealFIlePre(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print('::::done');
          return realFilePre;
        }else{
          print('::::else');
          return Image.asset(
            common.selectIcon(extension),
            height: iconHeight,
            width: iconWidth,
          );
        }
      },
    );
  }

  // 对真实图片的异步加载
  Future<Widget> returnRealFIlePre() async {
    return realFilePre =
        new RealFilePre(common, file, extension, fileHeight, fileWidth);
  }
}
