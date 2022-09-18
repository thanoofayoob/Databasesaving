import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:machine_test/app/Bindings/initialBindings.dart';
import 'package:machine_test/app/modules/homePage/Model/generalResponse.dart';
import 'package:machine_test/app/utils/adapters.dart';
import 'package:machine_test/app/utils/cPrint.dart';
import 'package:path_provider/path_provider.dart';

import 'app/modules/homePage/View/homePageView.dart';
import 'app/network/DioClient.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<DioClient>(DioClient(Dio()));
  final documentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(documentDirectory.path);
  Hive.registerAdapter(GeneralResponseAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(GeoAdapter());
  Hive.registerAdapter(CompanyAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: InitialBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
