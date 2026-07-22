import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/database/enums.dart';
import '../../../shared/widgets/app_card.dart';

class TableCard extends StatelessWidget {
  final String tableName;
  final int capacity;
  final TableStatus status;
  final double? totalAmount;
  final VoidCallback? onTap;

  const TableCard({
    super.key,
    required this.tableName,
    required this.capacity,
    required this.status,
    this.totalAmount,
    this.onTap,
  });

  Color get statusColor {
    switch (status) {
      case TableStatus.available:
        return AppColors.success;

      case TableStatus.occupied:
        return AppColors.error;

      case TableStatus.reserved:
        return AppColors.warning;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case TableStatus.available:
        return Icons.check_circle;

      case TableStatus.occupied:
        return Icons.restaurant;

      case TableStatus.reserved:
        return Icons.bookmark;
    }
  }

  String get statusText {
    switch (status) {
      case TableStatus.available:
        return "Boş";

      case TableStatus.occupied:
        return "Dolu";

      case TableStatus.reserved:
        return "Rezerv";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: statusColor.withValues(alpha: 0.15),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                ),
              ),
              const Spacer(),
              Text(
                tableName,
                style: AppTextStyles.title,
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          Row(
            children: [
              const Icon(Icons.people_outline),
              const SizedBox(width: 6),
              Text("$capacity nəfər"),
            ],
          ),

          const Spacer(),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Row(
              children: [
                Icon(
                  statusIcon,
                  size: 18,
                  color: statusColor,
                ),
                const SizedBox(width: 8),
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          if (totalAmount != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              "${totalAmount!.toStringAsFixed(2)} ₼",
              style: AppTextStyles.headline.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ],
      ),
    );
  }
}