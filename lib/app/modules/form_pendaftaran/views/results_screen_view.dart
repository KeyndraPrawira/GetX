import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ResultsScreenView extends GetView {
  const ResultsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResultsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResultsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
