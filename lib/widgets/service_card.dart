import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String workers;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.workers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 9),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 29,
            color: AppColors.primaryBlue,
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: AppTextStyles.cardTitle,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 2),

          Text(
            '$workers workers',
            style: AppTextStyles.cardSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}