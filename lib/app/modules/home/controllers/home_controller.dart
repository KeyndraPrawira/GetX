import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement CounterController

  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex(index);
  }
  

}