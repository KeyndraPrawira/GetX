import 'package:get/get.dart';

import '../modules/form_pendaftaran/bindings/form_pendaftaran_binding.dart';
import '../modules/form_pendaftaran/views/form_pendaftaran_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/counter_view.dart';
import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const CounterView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PENDAFTARAN,
      page: () => const FormPendaftaranView(),
      binding: FormPendaftaranBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () =>  PostView(),
      binding: PostBinding(),
    ),
  ];
}
