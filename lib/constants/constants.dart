import 'package:ar_grocery_companion/models/sample.dart';

import 'package:augmented_reality_plugin_wikitude/startupConfiguration.dart';

double defaultPadding = 20.0;

Sample imageTrackingSample = Sample(
  name: "Html drawable",
  path: "01_ImageTracking_4_HtmlDrawable/index.html",
  requiredFeatures: ["image_tracking"],
  requiredExtensions: [],
  startupConfiguration: StartupConfiguration(
      cameraPosition: CameraPosition.BACK,
      cameraResolution: CameraResolution.AUTO),
);
