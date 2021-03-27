import 'package:flutter/material.dart';
import './app.dart';
import 'loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'personal_tag/personal_tag_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner:false,
  title:'qq',
  theme: mDefaultTheme,
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingPage(),
    "app":(BuildContext context) => App(),
    "/download":(_) => WebviewScaffold(
        url: "https://im.qq.com",
        appBar: AppBar(
          title: Text("下载QQ"),
        ),
        withZoom: true,
        withLocalStorage: true,
    ),
  }
));

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Color(0xff2aa9fb),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f),
);