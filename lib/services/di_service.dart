
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../controllers/splash_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
  }
}
