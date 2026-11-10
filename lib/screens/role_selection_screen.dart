import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/government_header.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const GovernmentHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  22,
                  16,
                  24,
                ),
                child: Column(
                  children: [
                    _brandHeader(),

                    const SizedBox(height: 28),

                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Select how you want to use the platform',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textGrey,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _roleCard(
                      context: context,
                      icon: Icons.person_outline,
                      iconColor: AppColors.primaryBlue,
                      iconBackground: const Color(0xFFE6F0FF),
                      title: 'Citizen',
                      subtitle:
                          'Find and book verified local service workers',
                      features: const [
                        'Browse services',
                        'Find nearby workers',
                        'Book services',
                        'Rate your experience',
                      ],
                      route: '/',
                    ),

                    const SizedBox(height: 12),

                    _roleCard(
                      context: context,
                      icon: Icons.engineering_outlined,
                      iconColor: const Color(0xFFE66A2C),
                      iconBackground: const Color(0xFFFFE9DF),
                      title: 'Worker',
                      subtitle:
                          'Manage your services, bookings and availability',
                      features: const [
                        'View service requests',
                        'Manage bookings',
                        'Update availability',
                        'Manage worker profile',
                      ],
                      route: '/worker-dashboard',
                    ),

                    const SizedBox(height: 12),

                    _roleCard(
                      context: context,
                      icon: Icons.account_balance_outlined,
                      iconColor: const Color(0xFF159447),
                      iconBackground: const Color(0xFFE8F8EC),
                      title: 'Cooperative',
                      subtitle:
                          'Manage workers, operations and cooperative services',
                      features: const [
                        'Verify workers',
                        'Manage workforce',
                        'Monitor bookings',
                        'View demand insights',
                      ],
                      route: '/cooperative-dashboard',
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Cooperative Digital Workforce Platform',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _brandHeader() {
    return Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.account_balance,
        size: 42,
        color: AppColors.darkBlue,
      ),
    );
  }

  Widget _roleCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String subtitle,
    required List<String> features,
    required String route,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          route,
          (route) => false,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: iconBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 27,
                  ),
                ),

                const SizedBox(width: 11),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 9,
                          height: 1.35,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right,
                  size: 21,
                  color: AppColors.textGrey,
                ),
              ],
            ),

            const SizedBox(height: 11),

            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFEAEFF4),
            ),

            const SizedBox(height: 10),

            ...features.map(
              (feature) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 13,
                        color: iconColor,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        feature,
                        style: const TextStyle(
                          fontSize: 8.5,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}