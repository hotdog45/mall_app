
import 'package:flutter/material.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  String bannerDetailUrl;
  var bannerName;

  WebViewPage(this.bannerDetailUrl, this.bannerName);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bannerName),
        centerTitle: true,
      ),
      body: WebviewScaffold(
        url: widget.bannerDetailUrl.isEmpty ? AppStrings.GITHUB : widget.bannerDetailUrl,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}
