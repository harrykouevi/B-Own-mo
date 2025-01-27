/*
 * File name: flutterwave_view.dart
 * Last modified: 2023.02.09 at 15:49:30
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/flutterwave_controller.dart';

class FlutterWaveViewWidget extends GetView<FlutterWaveController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "FlutterWave Payment".tr,
          style: Get.textTheme.titleLarge?.merge(TextStyle(letterSpacing: 1.3)),
        ),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Obx(() {
            return WebViewWidget(controller: controller.webView);
          }),
          Obx(() {
            if (controller.progress.value < 1) {
              return SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Get.theme.colorScheme.secondary.withOpacity(0.2),
                ),
              );
            } else {
              return SizedBox();
            }
          })
        ],
      ),
    );
  }
}
