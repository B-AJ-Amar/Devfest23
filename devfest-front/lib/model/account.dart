import 'dart:io';

import 'package:devfest/api/api_feed.dart';
import 'package:devfest/api/api_file.dart';
import 'package:devfest/api/api_image.dart';
import 'package:devfest/api/api_login.dart';
import 'package:devfest/api/api_notif.dart';
import 'package:devfest/api/api_payement.dart';
import 'package:devfest/model/feed.dart';
import 'package:devfest/model/file.dart';
import 'package:devfest/model/image.dart';
import 'package:devfest/model/notif.dart';
import 'package:devfest/model/payement.dart';
import 'package:flutter/material.dart';

class Account extends ChangeNotifier{
  static late  String username ;
  static late  String? auth_token;
  static bool is_delivered=false;
  static List<ProgresseImg>? progresseImgs=[];
  static List<Filee>? files=[];
  static List<Payement>? payements=[];
  static List<Notif>? notif=[];
  static List<Feed>? feeds=[];
  int feedlen = feeds!.length;


  static Future<void> getProgImg()async{
    ApiProgresseImgController apiImg = ApiProgresseImgController();
    await apiImg.fetchProgresseImg().then(
      (value) => Account.progresseImgs=value);
  }

  static Future<void> get_isDelivered()async{
    ApiLoginController apiImg = ApiLoginController();
    await apiImg.fetchCust().then(
      (value) => Account.is_delivered=value ?? false);
  }

  static Future<void> getFiles()async{
    ApiFileController apiImg = ApiFileController();
    await apiImg.fetchFile().then(
      (value) => Account.files=value);
  }

  static Future<void> getPayements()async{
    ApiPayementController apiImg = ApiPayementController();
    await apiImg.fetchPayement().then(
      (value) => Account.payements=value);
  }

  static Future<void> getNotif()async{
    ApiNotifController apiImg = ApiNotifController();
    await apiImg.fetchNotif().then(
      (value) => Account.notif=value ?? []);
  }

  static Future<void> getFeed(int id )async{
    ApiFeedController apiImg = ApiFeedController();
    await apiImg.fetchFeed(id).then(
      (value) => Account.feeds=value ?? []);
  }

  void setLenghFeed(){
    this.feedlen=Account.feeds!.length;
    notifyListeners();
  }
  void addFeed(Feed feed){
    Account.feeds!.add(feed);
    feedlen++;
    notifyListeners();
  }

}