import 'package:belajar_getx/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final AuthService api = AuthService();
  final box = GetStorage();

  var userProfile = <String, dynamic>{}.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading(true);
      final token = box.read('token');

      if (token == null) {
        Get.snackbar('Error', 'No authentication found', snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final response = await api.getProfile(token);

      if (response.statusCode == 200) {
        if (response.body != null) {
          userProfile.value = response.body;
        }else {
          throw Exception('Empty response body');
        }
      }else if (response.statusCode == 401) {
        Get.snackbar('Error', 'Unauthorized. Please login again.', snackPosition: SnackPosition.BOTTOM);
        box.remove('token');
        Get.offAllNamed('/login');
      } else {
        Get.snackbar('Error', 'Failed to fetch profile: ${response.statusText}', snackPosition: SnackPosition.BOTTOM);
      }
    
    }on Exception catch (e) {
      Get.snackbar('Error', e.toString().replaceAll('Exception : ', ''),
      snackPosition: SnackPosition.BOTTOM
      );
    }
    
     catch (e) {
      Get.snackbar('Unexpected Error', 'Something went wrong: ${e.toString()}',
      snackPosition: SnackPosition.BOTTOM
      );
    }finally {
      isLoading(false);
    }
  }

  Future<void> refreshProfile() async {
    await fetchProfile();
  }

  
}
