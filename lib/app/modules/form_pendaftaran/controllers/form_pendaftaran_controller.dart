



import 'package:belajar_getx/app/modules/form_pendaftaran/views/results_screen_view.dart';
import 'package:get/get.dart';

class FormPendaftaranController extends GetxController {
  
  //Variabel reaktif untuk field form
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  //Variabel jika error
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void ValidateName ({required name}){
    if (name.length < 3) {
       nameError.value = 'Nama minimal 3 karakter';
    } else if (name.length > 6) {
      nameError.value = 'Nama maksimal 6 karakter';
    } else {
      nameError.value = '';
    }
  }

  void validateGender ({required String gender }){
    if (gender == false) {
      dateOfBirthError.value = 'Pilih Jenis Kelamin';
    }
    
}

void validateDateOfBrith({required DateTime? tanggallahir}){
  if (tanggallahir == null) {
    dateOfBirthError.value = 'Pilih Tanggal lahir';

  } else {
    final now = DateTime.now();
    final age = now.year - tanggallahir.year;

    if (age < 15) {
      dateOfBirthError.value = 'Umur minimal 15 tahun';
    } else {
      dateOfBirthError.value = '';
    }
  }
}
  void validatePhone ({required String phone}){
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor telepon tidak valid';

    }else {
      phoneError.value = '';
    }
  }

  void SubmitForm () {
    ValidateName(name: name.value);
    validateGender(gender: gender.value);
    validateDateOfBrith(tanggallahir: dateOfBirth.value);
    validatePhone(phone: phone.value);
    

    if (nameError.value.isEmpty && genderError.value.isEmpty && dateOfBirthError.value.isEmpty && phoneError.value.isEmpty) {
      
      Get.to(
        () => ResultsScreenView(

        )
      );
    }
  }


}