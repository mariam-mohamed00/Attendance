import 'dart:developer';
import 'dart:io';

import 'package:attendance/my_theme.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:attendance/services/qrcode.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../HomeScreen.dart';

class Scan extends StatefulWidget {
  static const String routeName = 'Scan Screen';

  @override
  State<StatefulWidget> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final qrCodeService = QRCodeService();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(flex: 0, child: _buildQrView(context)),
          if (result != null)
            AlertDialog(
              backgroundColor: provider.appTheme == ThemeMode.light
                  ? MyTheme.whiteColor
                  : MyTheme.primaryDark,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  },
                  child: Text(
                    "Close",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16,
                        color:
                            // MyTheme.primaryLight
                            provider.appTheme == ThemeMode.light
                                ? MyTheme.primaryLight
                                : MyTheme.whiteColor),
                  ),
                )
              ],
              title: Text("Scan Successfully",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color:
                          // MyTheme.primaryLight
                          provider.appTheme == ThemeMode.light
                              ? MyTheme.primaryLight
                              : MyTheme.whiteColor,
                      fontWeight: FontWeight.bold)),
              icon: Icon(Icons.verified, color: Colors.green, size: 45),
              contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              content: Text(
                'Thanks for being here, Best Wishes.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.primaryLight),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      qrCodeService.scanQRCode(scanData.toString());
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
