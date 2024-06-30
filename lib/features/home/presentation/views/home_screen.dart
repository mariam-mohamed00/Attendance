import 'dart:async';

import 'package:attendance/core/providers/app_config_provider.dart';
import 'package:attendance/features/home/presentation/manager/qr_code/qr_code_cubit.dart';
import 'package:attendance/features/home/presentation/views/profile_screen.dart';
import 'package:attendance/features/home/presentation/views/setting/presentation/views/setting_screen.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/my_theme.dart';
import '../../data/qrcode.service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final qrCodeService = QRCodeService();

  /// location
  TextEditingController latitudeController = new TextEditingController();
  TextEditingController longitudeController = new TextEditingController();
  TextEditingController radiusController = new TextEditingController();
  StreamSubscription<GeofenceStatus>? geofenceStatusStream;
  Geolocator geolocator = Geolocator();
  String geofenceStatus = '';
  bool isReady = false;
  Position? position;

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("LOCATION => ${position!.toJson()}");
    isReady = (position != null) ? true : false;
  }

  setLocation() async {
    await getCurrentPosition();
    // print("POSITION => ${position!.toJson()}");
    latitudeController = TextEditingController(text: "30.605459");
    longitudeController = TextEditingController(text: "32.306019");
  }

  verifyCoordinates() async {
    String latitude = latitudeController.text;
    String longitude = longitudeController.text;

    if (latitude.isNotEmpty && longitude.isNotEmpty) {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          double.parse(latitude), double.parse(longitude));
      Placemark place = placeMarks.first;
      String? address = place.name;
      print('Address: $address');
      // Verify if the address is the expected one.
    } else {
      print('Please enter valid coordinates.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return BlocListener<QrCodeCubit, QrCodeState>(
      listener: (context, state) {
        if (state is QrCodeSuccess) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
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
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 16,
                                  color: provider.appTheme == ThemeMode.light
                                      ? MyTheme.primaryLight
                                      : MyTheme.whiteColor),
                        ),
                      )
                    ],
                    title: Text(
                      "Scan Successfully",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.primaryLight
                              : MyTheme.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(Icons.verified,
                        color: Colors.green, size: 45),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    content: Text(
                      'Thanks for being here, Best Wishes.',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor
                              : MyTheme.primaryLight),
                    ),
                  ));
        } else if (state is QrCodeFailed) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
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
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 16,
                                  color: provider.appTheme == ThemeMode.light
                                      ? MyTheme.primaryLight
                                      : MyTheme.whiteColor),
                        ),
                      )
                    ],
                    title: Text(
                      "Scan Failed",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.primaryLight
                              : MyTheme.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(Icons.sms_failed,
                        color: Colors.red, size: 45),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    content: Text(
                      state.failed,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor
                              : MyTheme.primaryLight),
                    ),
                  ));
        }
      },
      child: Scaffold(
        backgroundColor: provider.appTheme == ThemeMode.light
            ? MyTheme.whiteColor
            : MyTheme.primaryDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 75,
          title: Text(
            "Attendance",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: MyTheme.whiteColor),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(29),
                    bottomRight: Radius.circular(29)),
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.blue],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter)),
          ),
          systemOverlayStyle: provider.appTheme == ThemeMode.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          child: BottomNavigationBar(
            selectedItemColor: MyTheme.whiteColor,
            unselectedItemColor: MyTheme.primaryDark,
            backgroundColor: MyTheme.primaryLight,
            selectedIconTheme:
                IconThemeData(size: 25, color: MyTheme.whiteColor),
            selectedLabelStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
            unselectedIconTheme:
                IconThemeData(size: 20, color: MyTheme.primaryDark),
            unselectedLabelStyle:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () async {
                // Get the user's current location
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);

                // Check if the user is within the specified area
                double latitude = position.latitude;
                double longitude = position.longitude;
                double pointedLatitude = 30.621202;
                double pointedLongitude = 32.268393;
                double radius = 250.0; // in meters

                double distance = await Geolocator.distanceBetween(
                    latitude, longitude, pointedLatitude, pointedLongitude);

                if (distance <= radius) {
                  //   User is within the area, allow scanning
                  String barcodeScanRes;
                  try {
                    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                      '#ff6666',
                      'Cancel',
                      true,
                      ScanMode.QR,
                    );
                    debugPrint(barcodeScanRes);
                    context
                        .read<QrCodeCubit>()
                        .scanQrCode(scannedData: barcodeScanRes);
                  } on PlatformException {
                    barcodeScanRes = 'Failed to get platform version.';
                  }
                } else {
                  //   User is outside the area, show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You are not within the allowed area'),
                    ),
                  );
                }
              },
              child: const Icon(
                Icons.qr_code_scanner_sharp,
                size: 50,
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  List<Widget> tabs = [
    const ProfileScreen(),
    SettingScreen(),
  ];
}

/// scan in anywhere
//                 String barcodeScanRes;
//                 try {
//                   barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//                     '#ff6666',
//                     'Cancel',
//                     true,
//                     ScanMode.QR,
//                   );
//                   debugPrint(barcodeScanRes);
//                   context.read<QrCodeCubit>().scanQrCode(scannedData: barcodeScanRes);
//                 } on PlatformException {
//                   barcodeScanRes = 'Failed to get platform version.';
//                 }
