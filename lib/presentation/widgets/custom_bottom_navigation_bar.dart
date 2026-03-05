import 'package:flutter/material.dart';
import 'package:gerenciamento_agricola/core/theme/theme_extensions.dart';
import 'package:gerenciamento_agricola/core/theme/design_system/app_tokens.dart';
import 'package:gerenciamento_agricola/core/theme/app_text_styles.dart';

class CustomBottomNavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const CustomBottomNavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final List<CustomBottomNavItem> items;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late int _displayedIndex;

  @override
  void initState() {
    super.initState();
    _displayedIndex = widget.currentIndex;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _slideAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void didUpdateWidget(CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = AppThemeExtension.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final itemCount = widget.items.length;

    return Container(
      height: 118,
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / itemCount;

              return Stack(
                children: [
                  AnimatedBuilder(
                    animation: _slideAnimation,
                    builder: (context, _) {
                      final previousIndex = _displayedIndex;
                      final currentIndex = widget.currentIndex;
                      final from = previousIndex * itemWidth;
                      final to = currentIndex * itemWidth;
                      final left = from + (to - from) * _slideAnimation.value;

                      if (_slideAnimation.value == 1.0) {
                        _displayedIndex = currentIndex;
                      }

                      return Positioned(
                        left: left + AppSpacing.xs / 2,
                        top: 0,
                        bottom: 0,
                        width: itemWidth - AppSpacing.xs,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                customColors.gradientStart,
                                customColors.gradientEnd,
                              ],
                            ),
                            borderRadius: AppRadius.radiusXL,
                            border: Border.all(
                              color: customColors.gradientBorder,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: customColors.gradientEnd.withValues(
                                  alpha: 0.50,
                                ),
                                blurRadius: 24,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  Row(
                    children: List.generate(itemCount, (index) {
                      final isSelected = widget.currentIndex == index;
                      return _NavItem(
                        item: widget.items[index],
                        isSelected: isSelected,
                        onTap: () => widget.onTap(index),
                        colorScheme: colorScheme,
                        width: itemWidth,
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final CustomBottomNavItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final double width;

  const _NavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.radiusLG,
        child: SizedBox(
          height: 64,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  isSelected ? item.selectedIcon : item.icon,
                  key: ValueKey(isSelected),
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  size: 24,
                ),
              ),
              AppSpacing.gapXS,
              Flexible(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: AppTextStyles.labelSmall(context).copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                  child: Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
