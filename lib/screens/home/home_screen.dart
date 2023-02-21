import 'package:flutter/material.dart';
import 'package:fuelin_android/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants/app_colors.dart';

class HomeScreen extends GetView<HomeController> {
  final int userRole;
  const HomeScreen({required this.userRole, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Kasun's QR Code"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              controller.logout();
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.back();
          return Future.value(true);
        },
        child: SafeArea(
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: QrImage(
                        data: 'This is a simple QR code',
                        version: QrVersions.auto,
                        size: width * 0.6,
                        gapless: false,
                      ),
                    ),
                  ),
                  const Text("Please use above QR to obtain your fuel quota."),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: width * 0.1,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Vehicle Type",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "BIKE",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.1,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Customer Code",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "FUEL13#",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.1,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Vehicle Number",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "NES-1233",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: width * 0.1,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Fuel Type",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Petrol(95 Octane EURO 4)",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
