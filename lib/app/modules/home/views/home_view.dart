import 'package:belajar_getx/app/modules/alquran/views/alquran_view.dart';
import 'package:belajar_getx/app/modules/counter/views/counter_view.dart';
import 'package:belajar_getx/app/modules/form_pendaftaran/views/form_pendaftaran_view.dart';
import 'package:belajar_getx/app/modules/home/controllers/home_controller.dart';
import 'package:belajar_getx/app/modules/post/views/post_view.dart';
import 'package:belajar_getx/app/modules/profile/views/profile_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class Homeview extends GetView<HomeController> {
  const Homeview({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      CounterView(),
      PostView(),
      ProfileView()
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Homeview'), centerTitle: true),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.exposure, title: 'Counter'),
          TabItem(icon: Icons.photo_sharp, title:  'Post'),
          TabItem(icon: Icons.account_circle, title: 'Profile')
        ],
          initialActiveIndex: 0,
          onTap: controller.changePage,
          backgroundColor: Colors.blue,
      ),
      )
    ;
  }
}
