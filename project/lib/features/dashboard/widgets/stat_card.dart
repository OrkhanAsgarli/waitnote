import 'package:flutter/material.dart';

import '../../../shared/widgets/cards/app_card.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withValues(alpha: .15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: AppTextStyles.headline,
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }
}