import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/government_header.dart';
import '../widgets/app_header.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String selectedCategory = 'All';

  final List<_ServiceItem> services = const [
    // ----------------------------------------------------------
    // EXISTING SERVICES
    // ----------------------------------------------------------

    _ServiceItem(
      name: 'Plumbing',
      description: 'Pipe repair, leakage, installation',
      workers: '500+ Workers',
      icon: Icons.plumbing_outlined,
      category: 'Home Services',
      iconColor: Color(0xFF00A8E8),
      iconBackground: Color(0xFFE6F8FF),
    ),
    _ServiceItem(
      name: 'Electrical',
      description: 'Wiring, fixtures, repairs',
      workers: '420+ Workers',
      icon: Icons.bolt_outlined,
      category: 'Repair',
      iconColor: Color(0xFFF4B400),
      iconBackground: Color(0xFFFFF6D9),
    ),
    _ServiceItem(
      name: 'Carpentry',
      description: 'Furniture, wood work',
      workers: '310+ Workers',
      icon: Icons.handyman_outlined,
      category: 'Home Services',
      iconColor: Color(0xFFE66A2C),
      iconBackground: Color(0xFFFFE9DF),
    ),
    _ServiceItem(
      name: 'Cleaning',
      description: 'Home & office cleaning',
      workers: '280+ Workers',
      icon: Icons.cleaning_services_outlined,
      category: 'Cleaning',
      iconColor: Color(0xFF2BA84A),
      iconBackground: Color(0xFFE8F8EC),
    ),
    _ServiceItem(
      name: 'Appliance Repair',
      description: 'AC, Fridge, Washing Machine',
      workers: '210+ Workers',
      icon: Icons.kitchen_outlined,
      category: 'Repair',
      iconColor: Color(0xFF1976D2),
      iconBackground: Color(0xFFE6F0FF),
    ),
    _ServiceItem(
      name: 'Painting',
      description: 'Interior & exterior painting',
      workers: '190+ Workers',
      icon: Icons.format_paint_outlined,
      category: 'Home Services',
      iconColor: Color(0xFFE53935),
      iconBackground: Color(0xFFFFE8E8),
    ),
    _ServiceItem(
      name: 'Gardening',
      description: 'Garden maintenance & care',
      workers: '150+ Workers',
      icon: Icons.local_florist_outlined,
      category: 'Home Services',
      iconColor: Color(0xFF2E9B4B),
      iconBackground: Color(0xFFE8F7EA),
    ),

    // ----------------------------------------------------------
    // FOOD TECH SERVICES
    // ----------------------------------------------------------

    _ServiceItem(
      name: 'Home Cooking',
      description: 'Home meal preparation & cooking',
      workers: '120+ Workers',
      icon: Icons.restaurant_outlined,
      category: 'Food Tech',
      iconColor: Color(0xFFE67E22),
      iconBackground: Color(0xFFFFF0E3),
    ),
    _ServiceItem(
      name: 'Grocery Managing',
      description: 'Grocery purchase & management',
      workers: '100+ Workers',
      icon: Icons.shopping_cart_outlined,
      category: 'Food Tech',
      iconColor: Color(0xFF16A085),
      iconBackground: Color(0xFFE4F7F2),
    ),
    _ServiceItem(
      name: 'Catering',
      description: 'Event & community catering',
      workers: '90+ Workers',
      icon: Icons.restaurant_menu_outlined,
      category: 'Food Tech',
      iconColor: Color(0xFFD35400),
      iconBackground: Color(0xFFFFE9DC),
    ),
    _ServiceItem(
      name: 'Cloud Kitchen',
      description: 'Order-based food preparation',
      workers: '75+ Workers',
      icon: Icons.delivery_dining_outlined,
      category: 'Food Tech',
      iconColor: Color(0xFF8E44AD),
      iconBackground: Color(0xFFF3E8F8),
    ),

    // ----------------------------------------------------------
    // AGRICULTURE SERVICES
    // ----------------------------------------------------------

    _ServiceItem(
      name: 'Farm Labour Booking',
      description: 'Book workers for farm activities',
      workers: '180+ Workers',
      icon: Icons.agriculture_outlined,
      category: 'Agriculture',
      iconColor: Color(0xFF5B8C2A),
      iconBackground: Color(0xFFEAF5DF),
    ),
    _ServiceItem(
      name: 'Machinery Rental',
      description: 'Agricultural machinery & equipment',
      workers: '65+ Providers',
      icon: Icons.agriculture,
      category: 'Agriculture',
      iconColor: Color(0xFF9A6700),
      iconBackground: Color(0xFFFFF3D6),
    ),
    _ServiceItem(
      name: 'Crop Protection Services',
      description: 'Pest control, crop protection & farm support',
      workers: '55+ Providers',
      icon: Icons.eco_outlined,
      category: 'Agriculture',
      iconColor: Color(0xFF388E3C),
      iconBackground: Color(0xFFE7F5E7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredServices = selectedCategory == 'All'
        ? services
        : services
            .where(
              (service) => service.category == selectedCategory,
            )
            .toList();

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
                padding: const EdgeInsets.fromLTRB(
                  12,
                  12,
                  12,
                  18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _pageHeader(context),
                    const SizedBox(height: 12),
                    _searchBox(),
                    const SizedBox(height: 10),
                    _categoryFilters(),
                    const SizedBox(height: 12),

                    ...filteredServices.map(
                      (service) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: _serviceCard(
                          context,
                          service,
                        ),
                      ),
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
  // PAGE HEADER
  // ------------------------------------------------------------

  Widget _pageHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 18,
              color: AppColors.textDark,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // SEARCH + VOICE
  // ------------------------------------------------------------

  Widget _searchBox() {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(
            Icons.search,
            size: 18,
            color: AppColors.textGrey,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Search for a service...',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textGrey,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/voice-request',
              );
            },
            child: Container(
              width: 36,
              height: 34,
              margin: const EdgeInsets.only(
                right: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.mic_none_outlined,
                size: 19,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 2),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // CATEGORY FILTERS
  // ------------------------------------------------------------

  Widget _categoryFilters() {
    const categories = [
      'All',
      'Home Services',
      'Repair',
      'Cleaning',
      'Food Tech',
      'Agriculture',
    ];

    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 7);
        },
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primaryBlue
                    : Colors.white,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: selected
                      ? AppColors.primaryBlue
                      : AppColors.border,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: selected
                      ? Colors.white
                      : AppColors.textDark,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ------------------------------------------------------------
  // SERVICE CARD
  // ------------------------------------------------------------

  Widget _serviceCard(
    BuildContext context,
    _ServiceItem service,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/workers',
          arguments: {
            'service': service.name,
            'details': _serviceDetails(
              service.name,
            ),
          },
        );
      },
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 72,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: service.iconBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                service.icon,
                color: service.iconColor,
                size: 25,
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    service.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 8.5,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    service.workers,
                    style: const TextStyle(
                      fontSize: 8,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.textGrey,
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // SERVICE DETAILS
  // ------------------------------------------------------------

  String _serviceDetails(String serviceName) {
    switch (serviceName) {
      // Existing services
      case 'Plumbing':
        return 'Pipe leak repair';

      case 'Electrical':
        return 'Wiring and electrical repair';

      case 'Carpentry':
        return 'Furniture and wood work';

      case 'Cleaning':
        return 'Home and office cleaning';

      case 'Appliance Repair':
        return 'AC, fridge and washing machine repair';

      case 'Painting':
        return 'Interior and exterior painting';

      case 'Gardening':
        return 'Garden maintenance and care';

      // Food Tech
      case 'Home Cooking':
        return 'Home meal preparation and cooking';

      case 'Grocery Managing':
        return 'Grocery purchase and management';

      case 'Catering':
        return 'Event and community catering';

      case 'Cloud Kitchen':
        return 'Order-based food preparation';

      // Agriculture
      case 'Farm Labour Booking':
        return 'Farm labour and agricultural support';

      case 'Machinery Rental':
        return 'Agricultural machinery and equipment';

      case 'Crop Protection Services':
        return 'Pest control and crop protection';

      default:
        return 'Local service request';
    }
  }

  // ------------------------------------------------------------
  // BOTTOM NAVIGATION
  // ------------------------------------------------------------

  Widget _bottomNavigation(BuildContext context) {
    const items = [
      (
        'Home',
        Icons.home_outlined,
        '/',
      ),
      (
        'Services',
        Icons.grid_view_outlined,
        '/services',
      ),
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
          final selected = item.$1 == 'Services';

          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (item.$3 == '/') {
                  if (item.$1 == 'Home') {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  }
                  return;
                }

                if (item.$3 != '/services') {
                  Navigator.pushNamed(
                    context,
                    item.$3,
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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

// ------------------------------------------------------------
// SERVICE MODEL
// ------------------------------------------------------------

class _ServiceItem {
  final String name;
  final String description;
  final String workers;
  final IconData icon;
  final String category;
  final Color iconColor;
  final Color iconBackground;

  const _ServiceItem({
    required this.name,
    required this.description,
    required this.workers,
    required this.icon,
    required this.category,
    required this.iconColor,
    required this.iconBackground,
  });
}