import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/constant/app_strings.dart';

class H5WebViewPage extends StatefulWidget {
  String bannerDetailUrl;
  var bannerName;

  H5WebViewPage(this.bannerDetailUrl, this.bannerName);

  @override
  _H5WebViewPageState createState() => _H5WebViewPageState();
}

class _H5WebViewPageState extends State<H5WebViewPage> {

  IFrameElement _element;
  @override
  void initState() {
    //注册
    _element = IFrameElement()
      ..style.border = 'none'
      ..src = widget.bannerDetailUrl.isEmpty ? AppStrings.GITHUB : widget.bannerDetailUrl;


    ui.platformViewRegistry.registerViewFactory(
      'webInWeb',
          (int viewId) => _element,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bannerName),
        centerTitle: true,
      ),
      body: Container(child: HtmlElementView(viewType: 'webInWeb'),width: ScreenUtil.screenWidthDp,)
    );
  }
}
