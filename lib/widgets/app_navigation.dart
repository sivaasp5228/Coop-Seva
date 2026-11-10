import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AppNavigation extends StatelessWidget {
  final String selected;

  const AppNavigation({
    super.key,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavigationItem(
        title: 'Home',
        icon: Icons.home_outlined,
        route: '/',
      ),
      _NavigationItem(
        title: 'Services',
        icon: Icons.grid_view_outlined,
        route: '/services',
      ),
      _NavigationItem(
        title: 'Find Workers',
        icon: Icons.people_outline,
        route: '/workers',
      ),
      _NavigationItem(
        title: 'Schemes',
        icon: Icons.account_balance_outlined,
        route: '/',
      ),
      _NavigationItem(
        title: 'Dashboards',
        icon: Icons.dashboard_outlined,
        route: '/cooperative-dashboard',
      ),
      _NavigationItem(
        title: 'Help & Support',
        icon: Icons.help_outline,
        route: '/',
      ),
    ];

    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
          ),
          bottom: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item) {
            final isSelected = item.title == selected;

            return GestureDetector(
              onTap: () {
                if (item.title == 'Home') {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                  return;
                }

                if (item.route != '/') {
                  Navigator.pushNamed(
                    context,
                    item.route,
                  );
                }
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? AppColors.primaryBlue
                          : Colors.transparent,
                      width: 2.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 15,
                      color: isSelected
                          ? AppColors.primaryBlue
                          : AppColors.textDark,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: isSelected
                            ? AppColors.primaryBlue
                            : AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavigationItem {
  final String title;
  final IconData icon;
  final String route;

  const _NavigationItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}