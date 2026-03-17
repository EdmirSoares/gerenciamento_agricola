import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';

class DashboardSummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  const DashboardSummaryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    final effectiveShadow = colorScheme.shadow.withValues(alpha: 0.02);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.radiusXXL,
        boxShadow: [
          BoxShadow(
            color: effectiveShadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: -2,
            
          ),
        ],
      ),
      child: Card(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusXXL),
        child: Padding(
          padding: AppSpacing.paddingMD,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 20),
                  AppSpacing.gapXS,
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.labelMedium(
                        context,
                      ).copyWith(color: onSurfaceVariant),
                    ),
                  ),
                ],
              ),
              AppSpacing.gapSM,
              Text(
                value,
                style: AppTextStyles.headlineMedium(
                  context,
                ).copyWith(color: color, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall(
                  context,
                ).copyWith(color: onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
