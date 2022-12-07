import 'package:ar_grocery_companion/models/sample.dart';
import 'package:flutter/material.dart';

import 'package:augmented_reality_plugin_wikitude/architect_widget.dart';

import 'package:wakelock/wakelock.dart';

class ARView extends StatefulWidget {
  final Sample sample;

  const ARView({super.key, required this.sample});

  @override
  State<ARView> createState() => _ARViewState(sample: sample);
}

class _ARViewState extends State<ARView> with WidgetsBindingObserver {
  late ArchitectWidget architectWidget;
  String wikitudeTrialLicenseKey = "";

  Sample sample;
  String loadPath = "";
  bool loadFailed = false;

  _ARViewState({required this.sample}) {
    if (this.sample.path.contains("http://") ||
        this.sample.path.contains("https://")) {
      loadPath = this.sample.path;
    } else {
      loadPath = "samples/" + this.sample.path;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    architectWidget = new ArchitectWidget(
      onArchitectWidgetCreated: onArchitectWidgetCreated,
      licenseKey: wikitudeTrialLicenseKey,
      startupConfiguration: sample.startupConfiguration,
      features: sample.requiredFeatures,
    );

    Wakelock.enable();
  }

  @override
  void dispose() {
    this.architectWidget.pause();
    this.architectWidget.destroy();
    WidgetsBinding.instance.removeObserver(this);

    Wakelock.disable();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        this.architectWidget.pause();
        break;
      case AppLifecycleState.resumed:
        this.architectWidget.resume();
        break;

      default:
    }
  }

  Future<void> onArchitectWidgetCreated() async {
    this.architectWidget.load(loadPath, onLoadSuccess, onLoadFailed);
    this.architectWidget.resume();
  }

  Future<void> onLoadSuccess() async {
    loadFailed = false;
  }

  Future<void> onLoadFailed(String error) async {
    loadFailed = true;
    this.architectWidget.showAlert("Failed to load Architect World", error);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
