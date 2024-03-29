import 'package:ar_grocery_companion/constants/keys.dart';
import 'package:augmented_reality_plugin_wikitude/startupConfiguration.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/domain/sample.dart';

// Theme
Color kAppPrimaryColor = Color(0xFF549E83);

//Networking
String webscraperVPSAddress = "159.65.48.19";
int webscraperVPSPort = 5000;

//Layout
double defaultPadding = 20.0;

//AR
Sample imageTrackingSample = Sample(
  name: "Html drawable",
  path: "01_ImageTracking_4_HtmlDrawable/index.html",
  requiredFeatures: ["image_tracking"],
  requiredExtensions: [],
  startupConfiguration: StartupConfiguration(
      cameraPosition: CameraPosition.BACK,
      cameraResolution: CameraResolution.AUTO),
);

//Exception Handling Email
CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [
  EmailAutoHandler("smtp.gmail.com", 587, EmailID, "Grocar Exception Handling",
      EmailPassword, ["lsrjdev@gmail.com"]),
  ConsoleHandler()
]);

// Error images
String kNoLogoImg = "assets/images/no_logo.jpg";
String kNoProductImg = "assets/images/no_product.png";

const String kNoPfpImg = "profilepicture.jpg";
