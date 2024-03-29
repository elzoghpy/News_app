// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names, unused_import, unnecessary_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class WebViewScreen extends StatelessWidget {
  final String? url;

  WebViewScreen(article, {this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
