import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:belajar_getx/services/post_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';


class PostController extends GetxController {
  final PostService api = Get.put(PostService());

  RxList posts = <PostModel>[].obs; // data
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.fetchPosts();

      if (response.statusCode == 200) {
        final data = (response.body as List)
            .map((e) => PostModel.fromJson(e))
            .toList();
        posts.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
