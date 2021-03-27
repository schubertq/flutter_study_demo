import 'package:fixnum/fixnum.dart';

class DataCenter {
  Int64 uin = Int64(878393556);
  String version = "ios 8.2.0";

  factory DataCenter() =>_getInstance();
  static DataCenter get instance => _getInstance();
  static DataCenter _instance;
  DataCenter._internal() {
    
  }
  static DataCenter _getInstance() {
    if (_instance == null) {
      _instance = new DataCenter._internal();
    }
    return _instance;
  }
}