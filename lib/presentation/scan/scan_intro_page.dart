import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets/custom_animated_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:augmented_reality_plugin_wikitude/wikitude_plugin.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';

import 'package:ar_grocery_companion/domain/sample.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;
  late CameraController _controller;
  late List<CameraDescription> _cameras = [];
  late AnimationController _splashController;
  late AnimationController _splashController2;

  @override
  void initState() {
    super.initState();
    _splashController = AnimationController(vsync: this);
    _splashController2 = AnimationController(vsync: this);

    _splashController.addListener(() {
      if (_splashController.value > 0.7) {}
    });
    WidgetsBinding.instance.addObserver(this);
    availableCameras().then((cameras) {
      _cameras = cameras;
      if (_cameras.length > 0) {
        _controller = CameraController(_cameras[0], ResolutionPreset.max,
            enableAudio: false);
        _controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller.initialize();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _splashController.dispose();
    _splashController2.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldKey.currentState?.activate();

    if (_cameras.length == 0) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (!_controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    _controller.pausePreview;
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          CameraPreview(_controller),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(
              'assets/images/dot-pattern.json',
              controller: _splashController2,
              onLoaded: (composition) {
                _splashController2
                  ..duration = composition.duration
                  ..repeat(reverse: false);
              },
            ),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(
              'assets/splash/splash1.json',
              controller: _splashController,
              onLoaded: (composition) {
                _splashController
                  ..duration = composition.duration
                  ..repeat(reverse: true);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !_isLoading
                  ? CustomAnimatedButton(
                      text: "Start Scanning",
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).canvasColor,
                      func: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await _pushArView(sample: imageTrackingSample);
                        setState(() {
                          _isLoading = false;
                        });
                      },
                    )
                  : const CircularProgressIndicator(
                      color: Colors.black,
                    ),
            ],
          ),
        ],
      )),
    );
  }

  Future<WikitudeResponse> _requestARPermissions(List<String> features) async {
    return await WikitudePlugin.requestARPermissions(features);
  }

  void _showPermissionError(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Permissions required"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Open settings'),
                onPressed: () {
                  Navigator.of(context).pop();
                  WikitudePlugin.openAppSettings();
                },
              )
            ],
          );
        });
  }

  Future<void> _pushArView({required Sample sample}) async {
    WikitudeResponse permissionsResponse =
        await _requestARPermissions(sample.requiredFeatures);
    if (permissionsResponse.success) {
      GoRouter.of(context).push('/arview', extra: sample);
    } else {
      _showPermissionError(permissionsResponse.message);
    }
  }
}
