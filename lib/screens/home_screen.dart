import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/government_header.dart';
import '../widgets/app_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const GovernmentHeader(),
            const AppHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _hero(context),

                    const SizedBox(height: 16),

                    _sectionHeader(
                      'Popular Services',
                      onTap: () =>
                          Navigator.pushNamed(context, '/services'),
                    ),

                    const SizedBox(height: 9),

                    _popularServices(context),

                    const SizedBox(height: 14),

                    _cooperativeBanner(),

                    const SizedBox(height: 16),

                    const Text(
                      'Quick Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 9),

                    Row(
                      children: [
                        Expanded(
                          child: _quickService(
                            context,
                            icon: Icons.people_outline,
                            title: 'Find Workers',
                            subtitle: 'Verified workers',
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/workers',
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _quickService(
                            context,
                            icon: Icons.emergency_outlined,
                            title: 'Emergency',
                            subtitle: 'Urgent assistance',
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/workers',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            _bottomNavigation(context),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // HERO SECTION
  // ------------------------------------------------------------

  Widget _hero(BuildContext context) {
    return Container(
      height: 246,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF064A88),
            Color(0xFF006BCB),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background circle
          Positioned(
            right: -35,
            top: 8,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),

          // Worker image
          Positioned(
            right: -2,
            top: 10,
            bottom: 42,
            width: 175,
            child: ClipRect(
              child: Image.asset(
                'assets/ui/hero_worker_clean.png',
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),

          // Hero text
          const Positioned(
            left: 16,
            top: 18,
            right: 145,
            child: Text(
              'Empowering Cooperatives\n'
              'Connecting Citizens with\n'
              'Verified Local Workers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                height: 1.12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          // Subtitle
          const Positioned(
            left: 16,
            top: 104,
            child: Text(
              'Reliable. Verified. Cooperative.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Search box
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            height: 48,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        'Search for services (e.g. plumber...)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/services',
                      );
                    },
                    child: Container(
                      width: 78,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // SECTION HEADER
  // ------------------------------------------------------------

  Widget _sectionHeader(
    String title, {
    VoidCallback? onTap,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),

        const Spacer(),

        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: const Text(
              'View all',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }

  // ------------------------------------------------------------
  // POPULAR SERVICES
  // ------------------------------------------------------------

  Widget _popularServices(BuildContext context) {
    const services = [
      (
        'Plumbing',
        '1,245 workers',
        Icons.plumbing_outlined,
        Color(0xFF00A8E8),
        Color(0xFFE6F8FF),
      ),
      (
        'Electrical',
        '1,876 workers',
        Icons.bolt_outlined,
        Color(0xFFF4B400),
        Color(0xFFFFF6D9),
      ),
      (
        'Carpentry',
        '987 workers',
        Icons.handyman_outlined,
        Color(0xFFE66A2C),
        Color(0xFFFFE9DF),
      ),
      (
        'Cleaning',
        '2,241 workers',
        Icons.cleaning_services_outlined,
        Color(0xFF2BA84A),
        Color(0xFFE8F8EC),
      ),
      (
        'Painting',
        '1,102 workers',
        Icons.format_paint_outlined,
        Color(0xFFE53935),
        Color(0xFFFFE8E8),
      ),
      (
        'Appliance Repair',
        '805 workers',
        Icons.kitchen_outlined,
        Color(0xFF1976D2),
        Color(0xFFE6F0FF),
      ),
      (
        'Gardening',
        '654 workers',
        Icons.local_florist_outlined,
        Color(0xFF2E9B4B),
        Color(0xFFE8F7EA),
      ),
      (
        'More',
        'View services',
        Icons.apps_outlined,
        AppColors.primaryBlue,
        Color(0xFFEAF4FF),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: .82,
      ),
      itemBuilder: (context, index) {
        final item = services[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/services',
            );
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(
              5,
              9,
              5,
              7,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: item.$5,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(
                    item.$3,
                    color: item.$4,
                    size: 20,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item.$1,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9.5,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  item.$2,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 7.5,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------
  // COOPERATIVE BANNER
  // ------------------------------------------------------------

  Widget _cooperativeBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFC8E0FA),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.groups_outlined,
              color: AppColors.primaryBlue,
              size: 23,
            ),
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Together for a Stronger Cooperative Ecosystem',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkBlue,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  'Jobs • Welfare • Growth • Self-Reliance',
                  style: TextStyle(
                    fontSize: 8,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // QUICK SERVICE
  // ------------------------------------------------------------

  Widget _quickService(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 66,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF4FF),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryBlue,
                size: 22,
              ),
            ),

            const SizedBox(width: 9),

            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 8,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // BOTTOM NAVIGATION
  // ------------------------------------------------------------

  Widget _bottomNavigation(BuildContext context) {
    const items = [
      ('Home', Icons.home_outlined, '/'),
      ('Services', Icons.grid_view_outlined, '/services'),
      (
        'Bookings',
        Icons.calendar_month_outlined,
        '/booking',
      ),
      (
        'Messages',
        Icons.chat_bubble_outline,
        '/',
      ),
      (
        'Profile',
        Icons.person_outline,
        '/worker-profile',
      ),
    ];

    return Container(
      height: 66,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Row(
        children: items.map((item) {
          final selected = item.$1 == 'Home';

          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (item.$3 != '/') {
                  Navigator.pushNamed(
                    context,
                    item.$3,
                  );
                }
              },
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    item.$2,
                    size: 19,
                    color: selected
                        ? AppColors.primaryBlue
                        : AppColors.textGrey,
                  ),

                  const SizedBox(height: 3),

                  Text(
                    item.$1,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: selected
                          ? AppColors.primaryBlue
                          : AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}