import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/app/network/DioClient.dart';
import 'package:machine_test/app/repositories/auth_repo.dart';
import 'package:machine_test/app/utils/cPrint.dart';

import '../Model/generalResponse.dart';

class HomePageController extends GetxController {
  GeneralRepo generalRepo = GeneralRepo();
  TextEditingController searchCtr = TextEditingController();

  List<GeneralResponse> homePageList = [];
  List<GeneralResponse> homePageListForSearch = [];

  bool homePageLoading = false;
  bool searchStarted = false;

  //

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    apiCallForHomePage();

    // checkWeatherDataIsAvailable();
  }

  void searchStop() {
    searchStarted = false;

    searchCtr.clear();
    update();
  }

  void searchFunction(String val) {
    searchStarted = true;
    homePageListForSearch.clear();
    update();
    if (val != '') {
      homePageList.forEach((data) {
        if (data.name!.contains(val) || data.email!.contains(val)) {
          homePageListForSearch.add(data);
        }
      });

      cPrint(homePageListForSearch.length);
    } else {
      searchStop();
    }
  }

  void checkWeatherDataIsAvailable() async {
    var result = await getTheDataFromDataBase();
    cPrint(result);
    if (result == false) {
      apiCallForHomePage();
    }
  }

  void setTheDataToDataBase() async {
    try {
      var box = await Hive.openBox<List<GeneralResponse>>('myBox');
      box.put('homePageData', homePageList);
    } catch (e) {
      cPrint(e.toString());
    }
  }

  Future<bool?> getTheDataFromDataBase() async {
    homePageLoading = true;
    update();
    try {
      var box = await Hive.openBox<List<GeneralResponse>>('myBox');
      List<GeneralResponse>? result = [];

      result = box.get('homePageData');

      // cPrint('Name: $result');

      if (result!.isEmpty) {
        return false;
      } else {
        homePageList = result;
        update();
        return true;
      }
    } catch (e) {
      cPrint(e.toString());
    }
    homePageLoading = false;
    update();
    return false;
  }

  Future<void> apiCallForHomePage() async {
    var res = await generalRepo.getHomePageDetails();

    if (res.status == ApiResponseStatus.completed) {
      try {
        homePageList = res.data!;
        update();
      } catch (e) {
        cPrint(e.toString());
      }

      cPrint(homePageList.length);
    }
  }
}
