import 'dart:convert';
import 'dart:io';

import 'package:booking_app/models/current_booking_model.dart';
import 'package:booking_app/models/package_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/api_consts.dart';
import '../data_services/http_services.dart';

class HomeViewModel with ChangeNotifier {
  List<dynamic> _bookingList = [];
  List<dynamic> _packageList = [];
  bool _isAnimatePage = false;

  int _currentIndex = 0;
  List<dynamic> get bookingList => _bookingList;
  int get currentIndex => _currentIndex;
  bool get isAnimatePage => _isAnimatePage;
  void currentIndexFxn([int? index]){
    _currentIndex = index ?? 0;
    notifyListeners();
  }
  void animate(){
    _isAnimatePage = !_isAnimatePage;
    notifyListeners();
  }

  List<dynamic> get packageList => _packageList;

  Future<http.Response?> bookingListApi() async {
    try {
      var response = await ApiProvider.getDataApi(ApiConsts.currentBookingAPi);
      final jsonData = jsonDecode(response.body);
      var data = jsonData['response'] ?? [];
      _bookingList = data;
      if (response.statusCode != 200) return null;
      _bookingList = data.map((e) => CurrentBookingModel.fromJson(e)).toList();
      notifyListeners();
    } on SocketException {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<http.Response?> packageListApi() async {
    try {
      var response = await ApiProvider.getDataApi(ApiConsts.packageAPi);
      final jsonData = jsonDecode(response.body);
      var data = jsonData['response'] ?? [];
      _packageList = data;
      if (response.statusCode != 200) return null;
      _packageList = data.map((e) => PackageModel.fromJson(e)).toList();
      notifyListeners();
    } on SocketException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
