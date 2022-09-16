import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/app/modules/homePage/Controller/homePageController.dart';
import 'package:machine_test/app/modules/homePage/View/innerPage.dart';
import 'package:machine_test/app/utils/cPrint.dart';

class MyHomePage extends GetView<HomePageController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(builder: (logic) {
        return SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          obscureText: false,
                          controller: logic.searchCtr,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search',
                          ),
                          onChanged: (x) {
                            logic.searchFunction(x);
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            logic.searchStop();
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                logic.homePageLoading
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: logic.searchStarted
                            ? ListView.separated(
                                separatorBuilder: (q, i) {
                                  return const Divider();
                                },
                                itemCount: logic.homePageListForSearch.length,
                                itemBuilder: (_, i) {
                                  return ListTile(
                                    onTap: () {
                                      Get.to(InnerPage(data: logic.homePageListForSearch[i]));
                                    },
                                    subtitle: logic.homePageListForSearch[i].company == null
                                        ? Text('company name not available')
                                        : Text(logic.homePageListForSearch[i].company!.name! ?? ''),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 18,
                                      child: logic.homePageListForSearch[i].profileImage == null
                                          ? Container()
                                          : ImageWidget(
                                              url: logic.homePageListForSearch[i].profileImage!,
                                              radius: 15,
                                              height: 30,
                                              width: 30,
                                            ),
                                    ),
                                    title: Text(logic.homePageListForSearch[i].name!),
                                  );
                                })
                            : ListView.separated(
                                separatorBuilder: (q, i) {
                                  return const Divider();
                                },
                                itemCount: logic.homePageList.length,
                                itemBuilder: (_, i) {
                                  return ListTile(
                                    onTap: () {
                                      Get.to(InnerPage(data: logic.homePageList[i]));
                                    },
                                    subtitle: logic.homePageList[i].company == null
                                        ? Text('company name not available')
                                        : Text(logic.homePageList[i].company!.name! ?? ''),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 18,
                                      child: logic.homePageList[i].profileImage == null
                                          ? Container()
                                          : ImageWidget(
                                              url: logic.homePageList[i].profileImage!,
                                              radius: 15,
                                              height: 30,
                                              width: 30,
                                            ),
                                    ),
                                    title: Text(logic.homePageList[i].name!),
                                  );
                                }),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ImageWidget extends StatelessWidget {
  String url;
  double height;
  double width;
  double radius;

  ImageWidget({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
            // decoration: BoxDecoration(border: Border.all(width: 0), borderRadius: BorderRadius.all(Radius.circular(radius))),
            child: CachedNetworkImage(
          height: height,
          width: width,
          fit: BoxFit.cover,
          imageUrl: url,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: SizedBox(
                height: 5,
                width: 5,
                child: CircularProgressIndicator(strokeWidth: 2, value: downloadProgress.progress, color: Colors.red),
              ),
            );
          },
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            size: 50,
            color: Colors.grey,
          ),
        )));
  }
}
