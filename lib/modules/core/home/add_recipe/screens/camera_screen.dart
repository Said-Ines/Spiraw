import 'dart:developer';

import 'package:camera/camera.dart';

import '../../../../../bases/screens/exports.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  var isCameraInitialized = Observable(false);

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.medium);
    _cameraController.initialize().then((_) {
      if (mounted) {
        isCameraInitialized.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Observer(
        observes: isCameraInitialized,
        builder: (context, value) {
          if (!isCameraInitialized.value) {
            return Container();
          }
          return CameraPreview(_cameraController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final XFile file = await _cameraController.takePicture();
            Get.back(result: file.path);
          } catch (e) {
            log("error taking picture: $e");
          }
        },
        child: const Icon(Icons.camera_alt),
      ).paddingOnly(bottom: 20),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
