import 'dart:io';

import 'package:attendance/my_theme.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:attendance/services/qrcode.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
  var _scanBarcodeResult;
  late AppConfigProvider provider;

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      debugPrint(barcodeScanRes);
      qrCodeService.scanQRCode(barcodeScanRes.toString());
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    scanBarcodeNormal();
    super.initState();
    provider = Provider.of<AppConfigProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (_scanBarcodeResult != null)
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
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 16,
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.primaryLight
                            : MyTheme.whiteColor),
                  ),
                )
              ],
              title: Text(
                "Scan Successfully",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.primaryLight
                        : MyTheme.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              icon: Icon(Icons.verified, color: Colors.green, size: 45),
              contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              content: Text(
                'Thanks for being here, Best Wishes.',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.primaryLight),
              ),
            ),
        ],
      ),
    );
  }
}
