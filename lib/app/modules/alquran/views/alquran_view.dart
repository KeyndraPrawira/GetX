import 'package:belajar_getx/app/modules/alquran/views/alquran_detail_view_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alquran_controller.dart';

class AlquranView extends GetView<AlquranController> {
  final AlquranController controller = Get.put(AlquranController());
  AlquranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Surat'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value)  {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchSurat,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final surat = controller.surat;
        if (surat.isEmpty) {
          return const Center(child: Text('Data kosong'));  
          
        }

        return ListView.separated(
          itemCount: surat.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) => 
          ListTile(
            leading: CircleAvatar(
              child: Text(surat[index].nama),
            ),
            title: Text(surat[index].nama!),
            subtitle: Text(surat[index].arti!),
            // onTap: () => Get.to(() => AlquranDetailViewView(surat: surat[index]
          )
          );
  })
        );

        // Default return statement to handle all cases
      }
    
  }

