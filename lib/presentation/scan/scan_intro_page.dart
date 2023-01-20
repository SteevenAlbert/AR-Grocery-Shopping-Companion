import 'package:augmented_reality_plugin_wikitude/wikitude_plugin.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/domain/sample.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_animated_button.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  bool _isLoading = false;
  late CameraController _controller;
  late List<CameraDescription> _cameras = [];
  late AnimationController _dotsController;

  @override
  void initState() {
    super.initState();
    _dotsController = AnimationController(vsync: this);

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
    _dotsController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameras.length == 0) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (!_controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
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
              controller: _dotsController,
              onLoaded: (composition) {
                _dotsController
                  ..duration = composition.duration
                  ..repeat(reverse: false);
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
