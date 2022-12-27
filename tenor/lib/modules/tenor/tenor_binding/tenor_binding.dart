import 'package:get/get.dart';

import '../tenor_controller/tenor_controller.dart';

class TenorBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TenorController());
  }
}
