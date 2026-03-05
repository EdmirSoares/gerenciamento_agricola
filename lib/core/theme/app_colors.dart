import 'dart:ui';

abstract final class AppColors {
  static const Color primary = Color(0xFF006D30);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF84FB9D);
  static const Color onPrimaryContainer = Color(0xFF00210A);
  static const Color inversePrimary = Color(0xFF67DE84);

  static const Color secondary = Color(0xFF516351);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFD3E8D2);
  static const Color onSecondaryContainer = Color(0xFF0E1F11);

  static const Color tertiary = Color(0xFF39656D);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFBDEAF4);
  static const Color onTertiaryContainer = Color(0xFF001F24);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  static const Color surfaceLight = Color(0xFFFCFDF7);
  static const Color onSurfaceLight = Color(0xFF1A1C19);
  static const Color surfaceLightVariant = Color(0xFFDCE5DA);
  static const Color onSurfaceLightVariant = Color(0xFF414941);
  static const Color surfaceDim = Color(0xFFDCE5DA);

  static const Color inverseSurfaceLight = Color(0xFF2E312E);
  static const Color onInverseSurfaceLight = Color(0xFFF0F1EC);

  static const Color outlineM3 = Color(0xFF727970);
  static const Color outlineVariantM3 = Color(0xFFC1C9BE);

  static const Color surfaceDark = Color(0xFF1A1C19);
  static const Color onSurfaceDark = Color(0xFFE2E3DE);
  static const Color surfaceDarkVariant = Color(0xFF414941);
  static const Color onSurfaceDarkVariant = Color(0xFFC1C98E);
  static const Color surfaceDarkBright = Color(0xFF414941);

  static const Color inverseSurfaceDark = Color(0xFFE2E3DE);
  static const Color onInverseSurfaceDark = Color(0xFF1A1C19);

  static const Color outlineDarkM3 = Color(0xFF9B9389);
  static const Color outlineVariantDarkM3 = Color(0xFF414941);

  static const Color primaryDark = Color(0xFF67DE84);
  static const Color onPrimaryDark = Color(0xFF003916);
  static const Color primaryContainerDark = Color(0xFF005323);
  static const Color onPrimaryContainerDark = Color(0xFF84FB9D);

  static const Color secondaryDark = Color(0xFFB7CCB6);
  static const Color onSecondaryDark = Color(0xFF233425);
  static const Color secondaryContainerDark = Color(0xFF394B3B);
  static const Color onSecondaryContainerDark = Color(0xFFD3E8D2);

  static const Color tertiaryDark = Color(0xFFA1CED7);
  static const Color onTertiaryDark = Color(0xFF00363E);
  static const Color tertiaryContainerDark = Color(0xFF204D55);
  static const Color onTertiaryContainerDark = Color(0xFFBDEAF4);

  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color onErrorDark = Color(0xFF690005);
  static const Color errorContainerDark = Color(0xFF93000A);
  static const Color onErrorContainerDark = Color(0xFFFFDAD6);

  static const Color neutralGray = Color(0xFF757575);
  static const Color neutralGrayLight = Color(0xFFBDBDBD);
  static const Color neutralGrayDark = Color(0xFF424242);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color successGreen = Color(0xFF006D30);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color infoBlue = Color(0xFF39656D);

  static const Color stockCritical = Color(0xFFBA1A1A);
  static const Color stockLow = Color(0xFFFF9800);
  static const Color stockNormal = Color(0xFF006D30);
  static const Color stockHigh = Color(0xFF39656D);

  static const Color financialProfit = Color(0xFF006D30);
  static const Color financialLoss = Color(0xFFBA1A1A);
  static const Color financialNeutral = Color(0xFF757575);

  static const Color expiringWarning = Color(0xFFFF9800);
  static const Color expired = Color(0xFFBA1A1A);

  static const Color purchasePaid = Color(0xFF006D30);
  static const Color purchasePending = Color(0xFFFF9800);
  static const Color purchaseOverdue = Color(0xFFBA1A1A);

  static const Color productionHighMargin = Color(0xFF006D30);
  static const Color productionMediumMargin = Color(0xFF39656D);
  static const Color productionLowMargin = Color(0xFFFF9800);
  static const Color productionNegativeMargin = Color(0xFFBA1A1A);

  static const Color gradientLightStart = Color(0xFF2DB84B);
  static const Color gradientLightEnd = Color(0xFF006D30);
  static const Color gradientBorder = Color(0xFFE2E3DE);

  static const Color gradientDarkStart = Color(0xFF39E068);
  static const Color gradientDarkEnd = Color.fromARGB(255, 7, 30, 17);

  static const Color primaryGreen = primary;
  static const Color primaryGreenLight = primaryContainer;
  static const Color primaryGreenDark = onPrimaryContainer;
  static const Color secondaryBrown = secondary;
  static const Color secondaryBrownLight = secondaryContainer;
  static const Color secondaryBrownDark = onSecondaryContainer;
  static const Color tertiaryYellow = tertiary;
  static const Color tertiaryYellowLight = tertiaryContainer;
  static const Color tertiaryYellowDark = onTertiaryContainer;
  static const Color errorRed = error;
  static const Color errorRedLight = errorContainer;
  static const Color errorRedDark = onErrorContainer;
}
