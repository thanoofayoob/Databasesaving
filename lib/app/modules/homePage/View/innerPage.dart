import 'package:flutter/material.dart';
import 'package:machine_test/app/modules/homePage/Model/generalResponse.dart';

import 'homePageView.dart';

class InnerPage extends StatelessWidget {
  GeneralResponse data;

  InnerPage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 52,
                  backgroundColor: Colors.white,
                  child: ImageWidget(
                    url: data.profileImage! ?? "",
                    radius: 50,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              Text(
                'Personal Details',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                data.name! ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Text(
                data.username! ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.email! ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.phone! ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.username! ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'Address Details',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                data.address!.street ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.address!.city ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.address!.suite ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.address!.zipcode ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'Company Details',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                data.company!.name! ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                data.company!.catchPhrase! ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
