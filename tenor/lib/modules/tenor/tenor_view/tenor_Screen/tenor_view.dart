import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tenor/common/colors/Constantes.dart';
import 'package:tenor/modules/tenor/tenor_controller/tenor_controller.dart';
import 'package:tenor/modules/tenor/tenor_view/Details_screen/details_screen.dart';
import 'package:tenor/modules/tenor/tenor_view/tenor_Screen/widget/header_view.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../tenor_models/tenor_model.dart';
import 'widget/loading_view.dart';

class TenorView extends GetView<TenorController> {
  const TenorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: RefreshIndicator(
            color: white,
            backgroundColor: Colors.grey.shade900,
            onRefresh: () async {
              if (controller.searchTextController.value.text.isEmpty) {
                await controller.loadData();
              }
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: controller.scrollController,
              child: Column(children: [
                const HeaderView(),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.results.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 9,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Result? obj = controller.results[index];
                              Get.to(
                                () => (DetailsScreen(
                                  obj: obj,
                                  keyName: 'tag${[index]}',
                                )),
                                curve: Curves.elasticIn,
                              );
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: Hero(
                                tag: 'tag${[index]}',
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image:
                                      '${controller.results[index].media.first['tinygif']['url']}',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
                const LoadingView()
              ]),
            ),
          )),
    );
  }
}
