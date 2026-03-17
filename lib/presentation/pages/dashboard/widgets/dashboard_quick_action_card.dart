import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';

class DashboardQuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DashboardQuickActionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveColor = colorScheme.primary;
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
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: AppSpacing.paddingSM,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32, color: effectiveColor),
                AppSpacing.gapXS,
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.labelSmall(
                    context,
                  ).copyWith(color: effectiveColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
