import 'export.dart';

class CColors {
  CColors._privateConstructor();

  static const Color transparent = Color(0x00FFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF0000);
  static const Color gray = Color(0xFFBCBEC0);
  static const Color primary = Color(0xFF5882C1);
  static const Color secondary = Color(0xFF003465);
  static const Color ternary = Color(0xFF05FBF3);
  static Color primaryOP11Per = primary.withOpacity(0.11);
  static Color primaryOP28Per = primary.withOpacity(0.28);
  static Color primaryOP49Per = primary.withOpacity(0.49);

  static LinearGradient linearGradient = LinearGradient(
    colors: [primaryOP49Per, primaryOP11Per],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
