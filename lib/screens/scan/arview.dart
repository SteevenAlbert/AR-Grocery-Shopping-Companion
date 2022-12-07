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
  String wikitudeTrialLicenseKey =
      "w6GDoKSVPR5sSjaTctXRrhFGGM7ktSMCmt4l2uzH0b+hrsTSYVoZvF2by6X/TZgiU10ZSMdM7FBlUS95EgUE1c4lWFWOS/RXMW1XMBr866jUVodVQfYYhI8cq46mrqEybT9v+ZtpZoo4P2oTGuvF8JU0NbF97HpVr3FczyF3ubRTYWx0ZWRfXyuGS1OqcaGGTQIy9LD3wqHsOUtOepyOVCkX9g29lm89SjgmvG/YpRfC0ScVOwW71Va5YqK/D6DuTXjiVElqIxvtbbn4KaWxshlRkC3ndOMYyuyHgFhscLWZbj5LX7BVOulOMSUsniOzYEi8nfs6kpqhjubbygrp3kaesacDGBT3WbBjovOdbMTqUkFDpO1ftewRHe8rBAvAMPug6iwXgC0HePBUtteeXrkEBs9ViUO1iPiYqyKABoQFo8M1x4xn2med44KUrCZ1cVpp5CEgcspf49hvQIxZztaFJb5knFZjBbpUNsOnTrDMGK9oruXdBqkVN3xWvnWYsOWRGOf96+yRmMW4qZvBZFjW36WVDEEEpCjI/SSWXHcB94uBnji1TDFw1H7ipO9u5+o3nPz0O+OdAwT109kB8BbNOUx1jVw5Fd5q/yw+mn1DXAhMKTZOh2aBG3yj4gW6ivHPjbOdfpVZfUoEXj01sLr6bNnw87Ib7gfTepPLgDcV28EPjI+h7KYnpZ7y8JkyV0Z92m0dBXAX1JOAFsBvmqKlZIBdxsYlQL0P3Jw6DyaH1/Hdlm9/FTJFCm/0sOQU5cUZb/BI+p6a3nxIDj1QRKWBWkVfkU4cnB5yl2TlHqa0D6U/4OJR4fTzgI1jCWNs3/8vNP/t/p9jyybqCyKE4b+pnQarNcfLrOSlpqwVogQ=";

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
    return Scaffold(
      appBar: AppBar(title: Text(sample.name)),
      body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: architectWidget),
    );
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
