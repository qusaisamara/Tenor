import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tenor/modules/tenor/tenor_controller/tenor_controller.dart';

import '../../../../../common/colors/Constantes.dart';
import '../../../../../common/widget/custom_text.dart';

class HeaderView extends GetView<TenorController> {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Expanded(
                  child: AnimationSearchBar(
                onChanged: (text)  {
                  if (text.isEmpty || text == '') {
                    controller.changeHeaderTitle.value = false;
                    controller.loadData();
                  } else {
                     controller.searchOfTenor(text, 10);
                    if (controller.changeHeaderTitle.value == true) {
                    } else {
                      controller.changeHeaderTitle.value = true;
                    }
                  }
                },
                searchTextEditingController:
                    controller.searchTextController.value,
                backIcon: Icons.arrow_back_ios_new,
                backIconColor: Colors.white,
                isBackButtonVisible: false,
                previousScreen: null,
                closeIconColor: Colors.white,
                centerTitle: 'Tenor',
                hintText: 'Search here...',
                centerTitleStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20),
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
                cursorColor: Colors.lightBlue.shade300,
                duration: const Duration(milliseconds: 500),
                searchFieldHeight: 35,
                searchBarHeight: 50,
                searchBarWidth: MediaQuery.of(context).size.width -
                    20, // Total width of this Widget
                horizontalPadding: 5,
                verticalPadding: 0,
                searchIconColor: Colors.white.withOpacity(.7),
                searchFieldDecoration: BoxDecoration(
                    color: Colors.blueGrey.shade700,
                    border: Border.all(
                        color: Colors.black.withOpacity(.2), width: .5),
                    borderRadius: BorderRadius.circular(15)),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => SizedBox(
                  width: 20.w,
                  child: controller.changeHeaderTitle.value == false
                      ? Image.asset('assets/image/fire.png')
                      : const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))),
              const SizedBox(
                width: 5,
              ),
              Obx(() => CustomText(
                    text: controller.changeHeaderTitle.value == false
                        ? 'Trending'
                        : 'Results',
                    color: white,
                    size: 18.sp,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
