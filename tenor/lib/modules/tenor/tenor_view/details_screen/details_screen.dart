import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tenor/common/colors/Constantes.dart';
import 'package:tenor/modules/tenor/tenor_controller/tenor_controller.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../common/widget/custom_button.dart';
import '../../tenor_models/tenor_model.dart';

class DetailsScreen extends GetView<TenorController> {
  const DetailsScreen({Key? key, required this.obj, required this.keyName})
      : super(key: key);
  final Result obj;
  final String keyName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Hero(
                    tag: keyName,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        width: Get.width,
                        child: FittedBox(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: '${obj.media.first['tinygif']['url']}',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  obj.contentDescription,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '#${obj.id}',
                  style: TextStyle(color: Colors.white, fontSize: 19.sp),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomButton(
            width: Get.width,
            onPressed: () {
              controller.launchInWebView(obj.url);
            },
            buttonText: 'Visit on Tenor',
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
