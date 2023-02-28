import 'package:flutter/material.dart';
import 'package:fuelin_android/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../constants/app_colors.dart';

class HomeScreen extends GetView<HomeController> {
  final int userRole;
  const HomeScreen({required this.userRole, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(HomeController());

    return controller.obx((state) {
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
              controller.initialData.value["type"] == "customer"
                  ? "Customer " + controller.initialData.value["customer_code"]
                  : controller.initialData.value["name"],
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
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
        body: WillPopScope(
          onWillPop: () {
            Get.back();
            return Future.value(true);
          },
          child: controller.initialData.value["type"] == "customer"
              ? SafeArea(
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
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    width: 2 // border color
                                    ),
                              ),
                              child: QrImage(
                                data: controller.initialData.value["customerId"]
                                    .toString(),
                                version: QrVersions.auto,
                                size: width * 0.7,
                                gapless: false,
                              ),
                            ),
                          ),
                          const Text(
                              "Please use above QR to obtain your fuel quota."),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.2),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: width * 0.1,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Text(
                                          "* Vehicle Type",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          " : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            controller.initialData
                                                .value["vehicle_type"]
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: width * 0.03,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Text(
                                          "* Vehicle Number",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          " : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            controller.initialData
                                                .value["vehicle_no"],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: width * 0.03,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Text(
                                          "* Fuel Type",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          " : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            controller
                                                .initialData.value["fuel_type"],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.06,
                          ),
                          PieChart(
                            dataMap: {
                              "Used Quota": controller
                                  .initialData.value["quota_used"]
                                  .toDouble(),
                              "Avaialble Quota": controller
                                      .initialData.value["quota_limit"]
                                      .toDouble() -
                                  controller.initialData.value["quota_used"]
                                      .toDouble()
                            },
                            animationDuration:
                                const Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            colorList: const <Color>[
                              Color.fromARGB(255, 5, 102, 46),
                              Color(0xffe17055),
                            ],
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 32,
                            centerText: "Quota Status",
                            legendOptions: const LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                            // gradientList: ---To add gradient colors---
                            // emptyColorGradient: ---Empty Color gradient---
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SafeArea(
                  child: SizedBox(
                  height: height,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: controller.scanQRCode,
                              child: Image.asset(
                                'assets/icons/qr-code.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Please tap on above button to scan."),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
        ),
      );
    },
        onLoading: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SizedBox(
            height: height,
            width: width,
            child: Shimmer.fromColors(
              baseColor: AppColors.primaryColor,
              highlightColor: Colors.yellow,
              child: const Center(
                child: Opacity(
                  opacity: 0.7,
                  child: Text(
                    'Loading FuelIn...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
