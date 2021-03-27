import 'dart:io';
import 'dart:typed_data';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'service_url.dart';

Future getMessagePageData() async {
  try {
    Response response;
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) {
          return true;
        };
    };
    response = await dio.post(requestUrl['messagePageUrl']);
    
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后台异常');
    }
  } catch(e) {
    return print(e);
  }
}

Future getContactsPageData() async {
  try {
    Response response;
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) {
          return true;
        };
    };
    response = await dio.post(requestUrl['contactsPageUrl']);
    
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后台异常');
    }
  } catch(e) {
    return print(e);
  }
}

Future getDynamicPageData() async {
  try {
    Response response;
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) {
          return true;
        };
    };
    response = await dio.post(requestUrl['dynamicsPageUrl']);
    
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后台异常');
    }
  } catch(e) {
    return print(e);
  }
}

Future sendSSORequest(String serviceCmd, Uint8List buffer) async {
  try {
    Map value = {
      'serviceCmd': serviceCmd,
      'buffer': buffer
    };
    final channel = MethodChannel('sso/netChannel');
    Map response = await channel.invokeMethod('sendSSORequest', value);
    return response;
  } on PlatformException catch(e) {
    print('sendSSORequest failed: ${e.message}');
  } on MissingPluginException {
    print('sendSSORequest not implemented');
  }
}