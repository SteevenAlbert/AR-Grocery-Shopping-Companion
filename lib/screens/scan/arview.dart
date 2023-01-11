import 'package:ar_grocery_companion/constants/keys.dart';
import 'package:ar_grocery_companion/models/sample.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';
import 'package:flutter/material.dart';

import 'package:augmented_reality_plugin_wikitude/architect_widget.dart';
import 'package:go_router/go_router.dart';

import '../../models/product.dart';

class ARView extends StatefulWidget {
  final Sample sample;

  const ARView({super.key, required this.sample});

  @override
  State<ARView> createState() => _ARViewState(sample: sample);
}

class _ARViewState extends State<ARView> with WidgetsBindingObserver {
  late ArchitectWidget architectWidget;
  String wikitudeTrialLicenseKey = kWikitudeTrialLicenseKey;
  String loadPath = "";
  bool loadFailed = false;

  Sample sample;

  _ARViewState({required this.sample}) {
    if (sample.path.contains("http://") || sample.path.contains("https://")) {
      loadPath = sample.path;
    } else {
      loadPath = "samples/${sample.path}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return architectWidget;
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

    this.architectWidget.setJSONObjectReceivedCallback(onJSONObjectReceived);
  }

  Future<void> onLoadSuccess() async {
    loadFailed = false;
  }

  Future<void> onLoadFailed(String error) async {
    loadFailed = true;
    architectWidget.showAlert("Failed to load Architect World", error);
  }

  Future<void> captureScreen() async {
    WikitudeResponse captureScreenResponse =
        await this.architectWidget.captureScreen(true, "");
    if (captureScreenResponse.success) {
      this.architectWidget.showAlert(
          "Success", "Image saved in: " + captureScreenResponse.message);
    } else {
      if (captureScreenResponse.message.contains("permission")) {
        this
            .architectWidget
            .showAlert("Error", captureScreenResponse.message, true);
      } else {
        this.architectWidget.showAlert("Error", captureScreenResponse.message);
      }
    }
  }

  Future<void> onJSONObjectReceived(Map<String, dynamic> jsonObject) async {
    if (jsonObject["action"] != null) {
      switch (jsonObject["action"]) {
        case "capture_screen":
          captureScreen();
          break;
        case "product_details":
          // GoRouter.of(context).go("/product/${jsonObject["product_id"]}");
          // break;
          GoRouter.of(context)
              .go("/product_page", extra: Product.retrieveProduct(9));
          break;
      }
    }
  }
}
