import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  RxInt hitung = 0.obs;

  void tambah() {
    if (hitung < 100) {
      
      hitung++;
    } 
    
    else {
      Get.snackbar(
        'Peringatan',
        'Hitungan sudah mencapai 100',
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,

    );
    }
    }

    void kurang(){
      if (hitung > 1) {
      hitung--;
    } 
    
    else {
      Get.snackbar(
        'Peringatan',
        'Hitungan kurang dari 1',
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
    );
    }
}
}