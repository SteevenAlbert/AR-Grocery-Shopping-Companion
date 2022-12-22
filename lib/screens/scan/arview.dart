import 'package:ar_grocery_companion/constants/keys.dart';
import 'package:ar_grocery_companion/models/sample.dart';
import 'package:flutter/material.dart';

import 'package:augmented_reality_plugin_wikitude/architect_widget.dart';

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
  }

  Future<void> onLoadSuccess() async {
    loadFailed = false;
  }

  Future<void> onLoadFailed(String error) async {
    loadFailed = true;
    architectWidget.showAlert("Failed to load Architect World", error);
  }
}
