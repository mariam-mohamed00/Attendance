import 'package:attendance/home/screens/tabs/Profile.dart';
import 'package:attendance/home/screens/tabs/qr_code_cubit.dart';
import 'package:attendance/home/screens/tabs/settings/setting_screen.dart';
import 'package:attendance/login/screens/login/login_screen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../services/qrcode.service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final qrCodeService = QRCodeService();

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
                              .subtitle1!
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
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.primaryLight
                              : MyTheme.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(Icons.verified, color: Colors.green, size: 45),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    content: Text(
                      'Thanks for being here, Best Wishes.',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
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
                              .subtitle1!
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
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.primaryLight
                              : MyTheme.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(Icons.sms_failed, color: Colors.red, size: 45),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    content: Text(
                      '${state.failed}',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
            child: const Icon(Icons.logout, size: 25.0),
          ),
          const SizedBox(
            width: 10,
          )
        ],
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
          selectedIconTheme: IconThemeData(size: 25, color: MyTheme.whiteColor),
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
            },
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              size: 50,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  List<Widget> tabs = [
    const Profile(),
    SettingScreen(),
  ];
}
