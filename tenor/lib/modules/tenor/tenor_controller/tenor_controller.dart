import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tenor/modules/tenor/tenor_models/tenor_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/fetch_api/tenor_api.dart';

class TenorController extends GetxController {
  final Rx<TextEditingController> searchTextController =
      TextEditingController().obs;
  ScrollController scrollController = ScrollController();
  TenorApi tenorApi = TenorApi();
  RxList<Result> results = <Result>[].obs;
  Tenor? tenorOpj;
  RxBool loading = false.obs;
  RxBool changeHeaderTitle = false.obs;
  RxInt limit = 10.obs;
  RxInt limitTrend = 10.obs;
  @override
  void onInit() async {
    loadData();
    addListenerPagination();
    super.onInit();
  }

  loadData() async {
    limitTrend.value = 10;
    tenorOpj = await tenorApi.fetchTrendingTenor(limitTrend.value);
    results.value = tenorOpj!.results;
  }

  addListenerPagination() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (searchTextController.value.text != '') {
          searchOfTenor(searchTextController.value.text, limit.value += 10);
        } else {
          tenorOpj = await tenorApi.fetchTrendingTenor(limitTrend.value += 10);
          results.value = tenorOpj!.results;
        }
      }
    });
  }

  searchOfTenor(String searchText, [int? limit]) async {
    Tenor? x = await tenorApi.searchTenorsGif(searchText, limit);
    results.value = x!.results;
  }

  Future<void> launchInWebView(String url) async {
    Uri gifUri = Uri.parse(url);
    if (!await launchUrl(
      gifUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $gifUri';
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    searchTextController.value.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
