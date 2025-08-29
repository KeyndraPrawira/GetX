import 'package:belajar_getx/app/data/models/quran.dart';
import 'package:belajar_getx/services/alquran_service.dart';
import 'package:get/get.dart';

class AlquranController extends GetxController {
  final QuranService api = Get.put(QuranService());

  

  RxList surat = <QuranModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchSurat();
  }


  void fetchSurat() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.fetchSurat();

      if (response.statusCode == 200) {
        final data = (response.body as List)
        .map((e) => QuranModel.fromJson(e)).toList();
        surat.assignAll(data);
      }else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
  
}
