import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AlquranDetailViewView extends GetView {
  const AlquranDetailViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlquranDetailViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AlquranDetailViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
