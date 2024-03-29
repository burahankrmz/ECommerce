import '../../../app/app_prefs.dart';
import '../../../app/di.dart';

class AppSize {

  static double s0 = _figmaToAppHeight(0);
  static const double s1 = 1;
  static const double s1_5 = 1.5;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s44 = 44.0;
  static const double s48 = 48.0;
  static const double s55 = 55.0;
  static const double s60 = 60.0;
  static const double s64 = 64.0;
  static const double s65 = 65.0;
  static const double s73 = 73.0;
  static const double s87 = 87.0;
  static const double s92 = 92.0;
  static const double s100 = 100.0;
  static const double s120 = 120.0;
  static const double s140 = 140.0;
  static const double s180 = 180.0;
  static const double s190 = 190.0;
  static double s376 = _figmaToAppHeight(376);

}

double _figmaToAppHeight(double i) {
  final AppPrefences _appPrefences = instance<AppPrefences>();
  return _appPrefences.figmaToAppHeight(i);
}
