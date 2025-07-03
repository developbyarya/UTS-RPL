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

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    try {
      print('Checking camera permission...');
      final status = await Permission.camera.request();
      print('Camera permission: $status');
      
      setState(() {
        hasPermission = status.isGranted;
        isLoading = false;
      });
    } catch (e) {
      print('Error checking permission: $e');
      setState(() {
        isLoading = false;
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
        Navigator.of(context).pop();
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
        title: const Text('Scan Barcode'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (hasPermission && controller != null) ...[
            IconButton(
              icon: const Icon(Icons.flash_off, color: Colors.white),
              onPressed: () => controller!.toggleTorch(),
            ),
            IconButton(
              icon: const Icon(Icons.camera_rear, color: Colors.white),
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
      return Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 16),
              Text(
                'Checking camera permission...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }

    if (!hasPermission) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                size: 64,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'Camera permission is required',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkPermission,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Grant Permission'),
              ),
            ],
          ),
        ),
      );
    }

    // Create controller only when we have permission and need to show the scanner
    if (controller == null) {
      controller = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        facing: CameraFacing.back,
        torchEnabled: false,
      );
    }

    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          MobileScanner(
            controller: controller!,
            onDetect: _onDetect,
          ),
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'Position barcode within the frame',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
