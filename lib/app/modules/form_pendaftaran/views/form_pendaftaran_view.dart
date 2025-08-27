import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_pendaftaran_controller.dart';

import 'package:intl/intl.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});
  
  @override
  Widget build(BuildContext context) {
        final FormPendaftaranController controller = Get.put(FormPendaftaranController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPendaftaranView'),
        centerTitle: true,
      ),
      body: Padding(        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: controller.nameError.value.isEmpty ? null : controller.nameError.value,
                ),
                onChanged: (value) {
                  controller.name.value = value;
                },
              )
              ),
            Obx(
              () => DropdownButtonFormField<String>(
                value:  controller.gender.value.isEmpty ? null : controller.gender.value,
                hint:  Text('Pilih Jenis Kelamin'),
                items: ['Laki-laki', 'Perempuan']
                .map((gender) => DropdownMenuItem(
                  value:  gender,
                  child:  Text(gender),
                ))
                .toList(),
                onChanged: (value) {
                  controller.gender.value = value ?? '';

                },
                )
            ),
            Obx(
              () => ListTile(
                title: Text(
                  controller.dateOfBirth.value == null ? 'Pilih Tanggal Lahir' : DateFormat('dd/MM/yyyy')
                  .format(controller.dateOfBirth.value!),
                ),
                trailing: Icon(Icons.calendar_month),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  
                  );
                  if (selectedDate != null) {
                    controller.dateOfBirth.value =selectedDate;
                    controller.validateDateOfBrith(tanggallahir: selectedDate);
                  }
                },
                subtitle: controller.dateOfBirthError.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          controller.dateOfBirthError.value,
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : null,
                
              )
            ),
            Obx(
              () => TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  errorText: controller.phoneError.value.isEmpty ? null : controller.phoneError.value,
                ),
                
                onChanged: (phone) {
                  controller.phone.value = phone;
                  controller.validatePhone(phone: phone);
                },
              ),
                   

              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){

                controller.SubmitForm();
              }, child:
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  color: Colors.blue,
                ),
              )
               )
            
            // Tambahkan widget lain di sini jika diperlukan
          ],
        ),
      ),);
    
  }
}