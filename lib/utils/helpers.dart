import 'export.dart';

typedef NavPageBuilder = Widget Function(BuildContext context, GoRouterState state);

class AppHelper {
  AppHelper._privateConstructor();

  //* Screen Size
  static late Size screenSize;

  //* Paddings
  static const double pad_6 = 6.0;
  static const double pad_7 = 7.0;
  static const double pad_12 = 12.0;
  static const double pad_16 = 16.0;
  static const double pad_20 = 20.0;
  static const double pad_26 = 26.0;
  static const double pad_30 = 30.0;
  static const double pad_32 = 32.0;
  static const double pad_36 = 36.0;
  static const double pad_38 = 38.0;
  static const double pad_50 = 50.0;
  static const double padInfinity = 9999.0;

  //* Border Radiuses
  static const double bRad_4 = 4.0;
  static const double bRad_6 = 6.0;
  static const double bRad_10 = 10.0;
  static const double bRad_20 = 20.0;
  static const double bRad_30 = 30.0;
  static const double bRad_40 = 40.0;
  static const double bRadInfinity = 9999.0;

  static FutureOr<bool?> showErrorToast(String msg) async {
    return await Fluttertoast.showToast(msg: msg, backgroundColor: CColors.red, fontSize: 14, textColor: CColors.white, toastLength: Toast.LENGTH_SHORT);
  }

  static FutureOr<bool?> showInfoToast(String msg) async {
    return await Fluttertoast.showToast(msg: msg, backgroundColor: CColors.primary, fontSize: 14, textColor: CColors.white, toastLength: Toast.LENGTH_SHORT);
  }
}
