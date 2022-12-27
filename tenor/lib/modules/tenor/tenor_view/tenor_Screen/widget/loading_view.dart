import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenor/modules/tenor/tenor_controller/tenor_controller.dart';

class LoadingView extends GetView<TenorController> {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value == false &&
            controller.results.length > 10 &&
            controller.results.length != 50
        ? SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        : Container());
  }
}
