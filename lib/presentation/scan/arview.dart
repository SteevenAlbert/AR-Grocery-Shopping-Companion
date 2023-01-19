import 'dart:convert';
import 'package:augmented_reality_plugin_wikitude/architect_widget.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/constants/keys.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/sample.dart';
import 'package:go_router/go_router.dart';
import '../../constants/constants.dart';
import '../../domain/models/product/product.dart';

class ARView extends StatefulWidget {
  const ARView({super.key});

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> with WidgetsBindingObserver {
  late ArchitectWidget architectWidget;
  String wikitudeTrialLicenseKey = kWikitudeTrialLicenseKey;
  String loadPath = "";
  bool loadFailed = false;

  Sample sample = imageTrackingSample;

  _ARViewState() {
    loadPath = "samples/${sample.path}";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          GoRouter.of(context).go("/customer_homepage");
          return Future.value(false);
        },
        child: architectWidget);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    architectWidget = ArchitectWidget(
      onArchitectWidgetCreated: onArchitectWidgetCreated,
      licenseKey: wikitudeTrialLicenseKey,
      startupConfiguration: sample.startupConfiguration,
      features: sample.requiredFeatures,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        architectWidget.pause();
        break;
      case AppLifecycleState.resumed:
        architectWidget.resume();
        break;

      default:
    }
  }

  @override
  void dispose() {
    architectWidget.pause();
    architectWidget.destroy();

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> onArchitectWidgetCreated() async {
    architectWidget.load(loadPath, onLoadSuccess, onLoadFailed);
    architectWidget.resume();
    //sample json data
    this.architectWidget.setJSONObjectReceivedCallback(onJSONObjectReceived);
  }

  Future<void> onLoadSuccess() async {
    loadFailed = false;
  }

  Future<void> onLoadFailed(String error) async {
    loadFailed = true;
    architectWidget.showAlert("Failed to load Architect World", error);
  }

  Future<void> onJSONObjectReceived(Map<String, dynamic> jsonObject) async {
    if (jsonObject["action"] != null) {
      //Return product info
      switch (jsonObject["action"]) {
        case "product_card":
          Product product = ProductsRepository.instance
              .getProduct(jsonObject["product_id"].toString());
          print(product.properties["Allergy Information"]);
          Map<String, dynamic> data = {
            "name": product.name,
            "Manfacturer": product.manufacturer,
            'Ingredients': product.properties['Ingredients'],
            "Allergy Information": product.properties['Allergy Information'],
          };
          this
              .architectWidget
              .callJavascript("World.loadProduct(" + jsonEncode(data) + ");");
          break;

        //Navigate to product page
        case "product_page":
          print("Navigating to product page");

          GoRouter.of(context).goNamed("ProductPage",
              extra: ProductsRepository.instance
                  .getProduct(jsonObject["product_id"]),
              params: {'fromAR': "true"});

          break;
      }
    }
  }
}
