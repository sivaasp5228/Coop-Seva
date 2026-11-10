import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GovernmentHeader extends StatelessWidget {
  const GovernmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: AppColors.governmentBlue,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(
            Icons.account_balance,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(width: 6),
          const Expanded(
            child: Text(
              'भारत सरकार | Government of India',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(
            'A−',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'A',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'A+',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 9),
          Container(
            width: 1,
            height: 15,
            color: Colors.white54,
          ),
          const SizedBox(width: 8),
          const Text(
            'English',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 14,
          ),
        ],
      ),
    );
  }
}