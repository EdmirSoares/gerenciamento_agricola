import 'package:flutter/material.dart';
import 'app_colors.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color stockCritical;
  final Color stockLow;
  final Color stockNormal;
  final Color stockHigh;
  final Color financialProfit;
  final Color financialLoss;
  final Color financialNeutral;
  final Color expiringWarning;
  final Color expired;
  final Color purchasePaid;
  final Color purchasePending;
  final Color purchaseOverdue;
  final Color productionHighMargin;
  final Color productionMediumMargin;
  final Color productionLowMargin;
  final Color productionNegativeMargin;
  final Color gradientStart;
  final Color gradientEnd;
  final Color gradientBorder;

  const AppThemeExtension({
    required this.stockCritical,
    required this.stockLow,
    required this.stockNormal,
    required this.stockHigh,
    required this.financialProfit,
    required this.financialLoss,
    required this.financialNeutral,
    required this.expiringWarning,
    required this.expired,
    required this.purchasePaid,
    required this.purchasePending,
    required this.purchaseOverdue,
    required this.productionHighMargin,
    required this.productionMediumMargin,
    required this.productionLowMargin,
    required this.productionNegativeMargin,
    required this.gradientStart,
    required this.gradientEnd,
    required this.gradientBorder,
  });

  factory AppThemeExtension.light() {
    return const AppThemeExtension(
      stockCritical: AppColors.stockCritical,
      stockLow: AppColors.stockLow,
      stockNormal: AppColors.stockNormal,
      stockHigh: AppColors.stockHigh,
      financialProfit: AppColors.financialProfit,
      financialLoss: AppColors.financialLoss,
      financialNeutral: AppColors.financialNeutral,
      expiringWarning: AppColors.expiringWarning,
      expired: AppColors.expired,
      purchasePaid: AppColors.purchasePaid,
      purchasePending: AppColors.purchasePending,
      purchaseOverdue: AppColors.purchaseOverdue,
      productionHighMargin: AppColors.productionHighMargin,
      productionMediumMargin: AppColors.productionMediumMargin,
      productionLowMargin: AppColors.productionLowMargin,
      productionNegativeMargin: AppColors.productionNegativeMargin,
      gradientStart: AppColors.gradientLightStart,
      gradientEnd: AppColors.gradientLightEnd,
      gradientBorder: AppColors.gradientBorder,
    );
  }

  factory AppThemeExtension.dark() {
    return const AppThemeExtension(
      stockCritical: AppColors.stockCritical,
      stockLow: AppColors.stockLow,
      stockNormal: AppColors.stockNormal,
      stockHigh: AppColors.stockHigh,
      financialProfit: AppColors.financialProfit,
      financialLoss: AppColors.financialLoss,
      financialNeutral: AppColors.financialNeutral,
      expiringWarning: AppColors.expiringWarning,
      expired: AppColors.expired,
      purchasePaid: AppColors.purchasePaid,
      purchasePending: AppColors.purchasePending,
      purchaseOverdue: AppColors.purchaseOverdue,
      productionHighMargin: AppColors.productionHighMargin,
      productionMediumMargin: AppColors.productionMediumMargin,
      productionLowMargin: AppColors.productionLowMargin,
      productionNegativeMargin: AppColors.productionNegativeMargin,
      gradientStart: AppColors.gradientDarkStart,
      gradientEnd: AppColors.gradientDarkEnd,
      gradientBorder: AppColors.gradientBorder,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? stockCritical,
    Color? stockLow,
    Color? stockNormal,
    Color? stockHigh,
    Color? financialProfit,
    Color? financialLoss,
    Color? financialNeutral,
    Color? expiringWarning,
    Color? expired,
    Color? purchasePaid,
    Color? purchasePending,
    Color? purchaseOverdue,
    Color? productionHighMargin,
    Color? productionMediumMargin,
    Color? productionLowMargin,
    Color? productionNegativeMargin,
    Color? gradientStart,
    Color? gradientEnd,
    Color? gradientBorder,
  }) {
    return AppThemeExtension(
      stockCritical: stockCritical ?? this.stockCritical,
      stockLow: stockLow ?? this.stockLow,
      stockNormal: stockNormal ?? this.stockNormal,
      stockHigh: stockHigh ?? this.stockHigh,
      financialProfit: financialProfit ?? this.financialProfit,
      financialLoss: financialLoss ?? this.financialLoss,
      financialNeutral: financialNeutral ?? this.financialNeutral,
      expiringWarning: expiringWarning ?? this.expiringWarning,
      expired: expired ?? this.expired,
      purchasePaid: purchasePaid ?? this.purchasePaid,
      purchasePending: purchasePending ?? this.purchasePending,
      purchaseOverdue: purchaseOverdue ?? this.purchaseOverdue,
      productionHighMargin: productionHighMargin ?? this.productionHighMargin,
      productionMediumMargin:
          productionMediumMargin ?? this.productionMediumMargin,
      productionLowMargin: productionLowMargin ?? this.productionLowMargin,
      productionNegativeMargin:
          productionNegativeMargin ?? this.productionNegativeMargin,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      gradientBorder: gradientBorder ?? this.gradientBorder,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;

    return AppThemeExtension(
      stockCritical:
          Color.lerp(stockCritical, other.stockCritical, t) ?? stockCritical,
      stockLow: Color.lerp(stockLow, other.stockLow, t) ?? stockLow,
      stockNormal: Color.lerp(stockNormal, other.stockNormal, t) ?? stockNormal,
      stockHigh: Color.lerp(stockHigh, other.stockHigh, t) ?? stockHigh,
      financialProfit:
          Color.lerp(financialProfit, other.financialProfit, t) ??
              financialProfit,
      financialLoss:
          Color.lerp(financialLoss, other.financialLoss, t) ?? financialLoss,
      financialNeutral:
          Color.lerp(financialNeutral, other.financialNeutral, t) ??
              financialNeutral,
      expiringWarning:
          Color.lerp(expiringWarning, other.expiringWarning, t) ??
              expiringWarning,
      expired: Color.lerp(expired, other.expired, t) ?? expired,
      purchasePaid:
          Color.lerp(purchasePaid, other.purchasePaid, t) ?? purchasePaid,
      purchasePending:
          Color.lerp(purchasePending, other.purchasePending, t) ??
              purchasePending,
      purchaseOverdue:
          Color.lerp(purchaseOverdue, other.purchaseOverdue, t) ??
              purchaseOverdue,
      productionHighMargin:
          Color.lerp(productionHighMargin, other.productionHighMargin, t) ??
              productionHighMargin,
      productionMediumMargin:
          Color.lerp(productionMediumMargin, other.productionMediumMargin, t) ??
              productionMediumMargin,
      productionLowMargin:
          Color.lerp(productionLowMargin, other.productionLowMargin, t) ??
              productionLowMargin,
      productionNegativeMargin:
          Color.lerp(productionNegativeMargin, other.productionNegativeMargin, t) ??
              productionNegativeMargin,
      gradientStart:
          Color.lerp(gradientStart, other.gradientStart, t) ?? gradientStart,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t) ?? gradientEnd,
      gradientBorder:
          Color.lerp(gradientBorder, other.gradientBorder, t) ?? gradientBorder,
    );
  }

  static AppThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<AppThemeExtension>()!;
  }
}
