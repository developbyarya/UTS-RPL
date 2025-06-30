import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeScannerWidget extends StatefulWidget {
  final Function(String code) onDetect;

  const BarcodeScannerWidget({super.key, required this.onDetect});

  @override
  State<BarcodeScannerWidget> createState() => _BarcodeScannerWidgetState();
}

class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
  MobileScannerController? controller;
  bool isDetected = false;
  bool hasPermission = false;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
  }

  Future<void> _initializeScanner() async {
    try {
      print('Initializing scanner...');
      
      // Check camera permission
      final status = await Permission.camera.request();
      print('Camera permission status: $status');
      
      if (status.isGranted) {
        setState(() {
          hasPermission = true;
          isLoading = false;
        });
        
        // Create controller after permission is granted
        controller = MobileScannerController();
        print('Scanner initialized successfully');
      } else {
        setState(() {
          hasPermission = false;
          isLoading = false;
          errorMessage = 'Camera permission denied';
        });
      }
    } catch (e) {
      print('Error initializing scanner: $e');
      setState(() {
        isLoading = false;
        errorMessage = 'Error initializing scanner: $e';
      });
    }
  }

  void _onDetect(BarcodeCapture capture) {
    if (!isDetected && capture.barcodes.isNotEmpty) {
      final barcode = capture.barcodes.first;
      if (barcode.rawValue != null) {
        print('Barcode detected: ${barcode.rawValue}');
        isDetected = true;
        widget.onDetect(barcode.rawValue!);
        controller?.stop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (hasPermission && controller != null) ...[
            IconButton(
              icon: ValueListenableBuilder(
                valueListenable: controller!.torchState,
                builder: (context, state, _) {
                  return Icon(
                    state == TorchState.off ? Icons.flash_off : Icons.flash_on,
                  );
                },
              ),
              onPressed: () => controller!.toggleTorch(),
            ),
            IconButton(
              icon: ValueListenableBuilder(
                valueListenable: controller!.cameraFacingState,
                builder: (context, state, _) {
                  return Icon(
                    state == CameraFacing.front ? Icons.camera_front : Icons.camera_rear,
                  );
                },
              ),
              onPressed: () => controller!.switchCamera(),
            ),
          ],
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Initializing camera...'),
          ],
        ),
      );
    }

    if (!hasPermission) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'Camera permission is required',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _initializeScanner,
              child: const Text('Grant Permission'),
            ),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $errorMessage',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  errorMessage = null;
                });
                _initializeScanner();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (controller == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Setting up camera...'),
          ],
        ),
      );
    }

    return MobileScanner(
      controller: controller!,
      onDetect: _onDetect,
    );
  }
}
