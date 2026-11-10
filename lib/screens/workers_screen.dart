import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/government_header.dart';
import '../widgets/app_header.dart';

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    String serviceName = 'Plumbing';
    String serviceDetails = 'Pipe leak repair';

    if (args is Map<String, dynamic>) {
      serviceName = args['service']?.toString() ?? serviceName;
      serviceDetails = args['details']?.toString() ?? serviceDetails;
    }

    final workerData = _getWorkers(serviceName);

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

                    _requestSummary(
                      serviceName,
                      serviceDetails,
                    ),

                    const SizedBox(height: 12),

                    _mapSection(),

                    const SizedBox(height: 14),

                    Text(
                      'Available Workers',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Verified workers near your location',
                      style: TextStyle(
                        fontSize: 9.5,
                        color: AppColors.textGrey,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...workerData.map(
                      (worker) => Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: _workerCard(
                          context: context,
                          name: worker['name']!,
                          skill: worker['skill']!,
                          rating: worker['rating']!,
                          reviews: worker['reviews']!,
                          distance: worker['distance']!,
                          availability: worker['availability']!,
                          amount: worker['amount']!,
                          avatarIcon:
                              worker['icon'] != null
                                  ? worker['icon'] as IconData
                                  : Icons.person,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Workers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Smart worker matching',
                style: TextStyle(
                  fontSize: 9,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
        ),

        Container(
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
            Icons.filter_list,
            size: 18,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // REQUEST SUMMARY
  // ------------------------------------------------------------

  Widget _requestSummary(
    String serviceName,
    String serviceDetails,
  ) {
    final serviceStyle = _serviceStyle(serviceName);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
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
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: serviceStyle['background'] as Color,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              serviceStyle['icon'] as IconData,
              color: serviceStyle['color'] as Color,
              size: 23,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  serviceDetails,
                  style: const TextStyle(
                    fontSize: 8.5,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Coimbatore',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                'Nearby workers',
                style: TextStyle(
                  fontSize: 8,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // MAP
  // ------------------------------------------------------------

  Widget _mapSection() {
    return Container(
      height: 190,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2E7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -30,
            top: 72,
            right: -30,
            child: Transform.rotate(
              angle: -0.18,
              child: Container(
                height: 22,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            left: 120,
            top: -30,
            bottom: -30,
            child: Transform.rotate(
              angle: 0.38,
              child: Container(
                width: 20,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            left: -20,
            bottom: 35,
            right: -20,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                height: 15,
                color: Colors.white,
              ),
            ),
          ),

          const Positioned(
            left: 18,
            top: 18,
            child: Text(
              'Coimbatore',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF61705F),
              ),
            ),
          ),

          const Positioned(
            right: 18,
            bottom: 20,
            child: Text(
              'Nearby Area',
              style: TextStyle(
                fontSize: 8,
                color: Color(0xFF71806E),
              ),
            ),
          ),

          _mapMarker(
            left: 55,
            top: 76,
            color: const Color(0xFF00A8E8),
          ),

          _mapMarker(
            left: 178,
            top: 48,
            color: const Color(0xFFE66A2C),
          ),

          _mapMarker(
            right: 55,
            top: 98,
            color: const Color(0xFF2BA84A),
          ),

          Positioned(
            left: 145,
            top: 125,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryBlue,
                  width: 3,
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Color(0x330066CC),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person_pin_circle,
                size: 19,
                color: AppColors.primaryBlue,
              ),
            ),
          ),

          Positioned(
            right: 10,
            top: 10,
            child: Column(
              children: [
                _mapControl(Icons.add),
                const SizedBox(height: 5),
                _mapControl(Icons.remove),
                const SizedBox(height: 5),
                _mapControl(Icons.my_location),
              ],
            ),
          ),

          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    size: 12,
                    color: AppColors.green,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Verified Workers',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
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

  Widget _mapMarker({
    double? left,
    double? right,
    required double top,
    required Color color,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: Color(0x33000000),
            ),
          ],
        ),
        child: const Icon(
          Icons.person,
          size: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _mapControl(IconData icon) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x22000000),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 16,
        color: AppColors.textDark,
      ),
    );
  }

  // ------------------------------------------------------------
  // WORKER DATA
  // ------------------------------------------------------------

  List<Map<String, dynamic>> _getWorkers(String service) {
    switch (service.toLowerCase()) {
      // ----------------------------------------------------------
      // PLUMBING
      // ----------------------------------------------------------

      case 'plumbing':
        return [
          {
            'name': 'Ramesh Kumar',
            'skill': 'Plumbing Specialist',
            'rating': '4.8',
            'reviews': '126 reviews',
            'distance': '1.2 km',
            'availability': 'Available Today',
            'amount': '₹350 onwards',
            'icon': Icons.plumbing,
          },
          {
            'name': 'Suresh Babu',
            'skill': 'Plumbing & Pipe Repair',
            'rating': '4.7',
            'reviews': '98 reviews',
            'distance': '2.1 km',
            'availability': 'Available Today',
            'amount': '₹300 onwards',
            'icon': Icons.plumbing,
          },
          {
            'name': 'Arun Kumar',
            'skill': 'Home Plumbing Services',
            'rating': '4.6',
            'reviews': '84 reviews',
            'distance': '2.8 km',
            'availability': 'Available Tomorrow',
            'amount': '₹320 onwards',
            'icon': Icons.plumbing,
          },
        ];

      // ----------------------------------------------------------
      // ELECTRICAL
      // ----------------------------------------------------------

      case 'electrical':
        return [
          {
            'name': 'Vijay Kumar',
            'skill': 'Electrical & Wiring Specialist',
            'rating': '4.9',
            'reviews': '142 reviews',
            'distance': '1.1 km',
            'availability': 'Available Today',
            'amount': '₹400 onwards',
            'icon': Icons.electrical_services,
          },
          {
            'name': 'Manoj Raj',
            'skill': 'Home Electrical Repair',
            'rating': '4.8',
            'reviews': '116 reviews',
            'distance': '1.9 km',
            'availability': 'Available Today',
            'amount': '₹350 onwards',
            'icon': Icons.electrical_services,
          },
          {
            'name': 'Karthik S',
            'skill': 'Wiring & Electrical Services',
            'rating': '4.7',
            'reviews': '91 reviews',
            'distance': '2.6 km',
            'availability': 'Available Tomorrow',
            'amount': '₹380 onwards',
            'icon': Icons.electrical_services,
          },
        ];

      // ----------------------------------------------------------
      // CARPENTRY
      // ----------------------------------------------------------

      case 'carpentry':
        return [
          {
            'name': 'Ravi Kumar',
            'skill': 'Furniture & Carpentry Specialist',
            'rating': '4.8',
            'reviews': '121 reviews',
            'distance': '1.3 km',
            'availability': 'Available Today',
            'amount': '₹450 onwards',
            'icon': Icons.handyman,
          },
          {
            'name': 'Sathish M',
            'skill': 'Wood Work & Furniture Repair',
            'rating': '4.7',
            'reviews': '103 reviews',
            'distance': '2.0 km',
            'availability': 'Available Today',
            'amount': '₹400 onwards',
            'icon': Icons.handyman,
          },
          {
            'name': 'Prakash R',
            'skill': 'Home Carpentry Services',
            'rating': '4.6',
            'reviews': '82 reviews',
            'distance': '2.7 km',
            'availability': 'Available Tomorrow',
            'amount': '₹420 onwards',
            'icon': Icons.handyman,
          },
        ];

      // ----------------------------------------------------------
      // CLEANING
      // ----------------------------------------------------------

      case 'cleaning':
        return [
          {
            'name': 'Priya Services',
            'skill': 'Home & Office Cleaning',
            'rating': '4.9',
            'reviews': '156 reviews',
            'distance': '1.0 km',
            'availability': 'Available Today',
            'amount': '₹300 onwards',
            'icon': Icons.cleaning_services,
          },
          {
            'name': 'CleanCare Team',
            'skill': 'Deep Cleaning Specialist',
            'rating': '4.8',
            'reviews': '118 reviews',
            'distance': '1.8 km',
            'availability': 'Available Today',
            'amount': '₹350 onwards',
            'icon': Icons.cleaning_services,
          },
          {
            'name': 'Meena Services',
            'skill': 'Residential Cleaning',
            'rating': '4.7',
            'reviews': '87 reviews',
            'distance': '2.5 km',
            'availability': 'Available Tomorrow',
            'amount': '₹280 onwards',
            'icon': Icons.cleaning_services,
          },
        ];

      // ----------------------------------------------------------
      // APPLIANCE REPAIR
      // ----------------------------------------------------------

      case 'appliance repair':
        return [
          {
            'name': 'Suresh Tech',
            'skill': 'AC & Appliance Repair',
            'rating': '4.9',
            'reviews': '134 reviews',
            'distance': '1.4 km',
            'availability': 'Available Today',
            'amount': '₹400 onwards',
            'icon': Icons.home_repair_service,
          },
          {
            'name': 'Arun Electronics',
            'skill': 'Fridge & Washing Machine Repair',
            'rating': '4.8',
            'reviews': '109 reviews',
            'distance': '2.0 km',
            'availability': 'Available Today',
            'amount': '₹350 onwards',
            'icon': Icons.home_repair_service,
          },
          {
            'name': 'TechCare Services',
            'skill': 'Home Appliance Specialist',
            'rating': '4.7',
            'reviews': '96 reviews',
            'distance': '2.8 km',
            'availability': 'Available Tomorrow',
            'amount': '₹380 onwards',
            'icon': Icons.home_repair_service,
          },
        ];

      // ----------------------------------------------------------
      // PAINTING
      // ----------------------------------------------------------

      case 'painting':
        return [
          {
            'name': 'Mohan Painters',
            'skill': 'Interior & Exterior Painting',
            'rating': '4.9',
            'reviews': '128 reviews',
            'distance': '1.2 km',
            'availability': 'Available Today',
            'amount': '₹500 onwards',
            'icon': Icons.format_paint,
          },
          {
            'name': 'Raja Painting Works',
            'skill': 'Home Painting Specialist',
            'rating': '4.7',
            'reviews': '94 reviews',
            'distance': '2.1 km',
            'availability': 'Available Today',
            'amount': '₹450 onwards',
            'icon': Icons.format_paint,
          },
          {
            'name': 'ColorCraft Services',
            'skill': 'Wall & Decorative Painting',
            'rating': '4.6',
            'reviews': '78 reviews',
            'distance': '2.9 km',
            'availability': 'Available Tomorrow',
            'amount': '₹480 onwards',
            'icon': Icons.format_paint,
          },
        ];

      // ----------------------------------------------------------
      // GARDENING
      // ----------------------------------------------------------

      case 'gardening':
        return [
          {
            'name': 'GreenCare Kumar',
            'skill': 'Garden Maintenance Specialist',
            'rating': '4.9',
            'reviews': '112 reviews',
            'distance': '1.3 km',
            'availability': 'Available Today',
            'amount': '₹300 onwards',
            'icon': Icons.local_florist,
          },
          {
            'name': 'Nature Services',
            'skill': 'Garden Care & Landscaping',
            'rating': '4.8',
            'reviews': '89 reviews',
            'distance': '2.0 km',
            'availability': 'Available Today',
            'amount': '₹350 onwards',
            'icon': Icons.local_florist,
          },
          {
            'name': 'Green Home Services',
            'skill': 'Plant & Garden Maintenance',
            'rating': '4.7',
            'reviews': '71 reviews',
            'distance': '2.7 km',
            'availability': 'Available Tomorrow',
            'amount': '₹280 onwards',
            'icon': Icons.local_florist,
          },
        ];

      // ----------------------------------------------------------
      // HOME COOKING
      // ----------------------------------------------------------

      case 'home cooking':
        return [
          {
            'name': 'Lakshmi Home Foods',
            'skill': 'Home Cooking & Meal Preparation',
            'rating': '4.9',
            'reviews': '118 reviews',
            'distance': '1.2 km',
            'availability': 'Available Today',
            'amount': '₹450 onwards',
            'icon': Icons.restaurant,
          },
          {
            'name': 'Meena Kitchen Services',
            'skill': 'Traditional South Indian Cooking',
            'rating': '4.8',
            'reviews': '96 reviews',
            'distance': '1.8 km',
            'availability': 'Available Today',
            'amount': '₹400 onwards',
            'icon': Icons.restaurant,
          },
          {
            'name': 'Anitha Home Chef',
            'skill': 'Daily Meal Preparation',
            'rating': '4.7',
            'reviews': '74 reviews',
            'distance': '2.4 km',
            'availability': 'Available Tomorrow',
            'amount': '₹350 onwards',
            'icon': Icons.restaurant,
          },
        ];

      // ----------------------------------------------------------
      // GROCERY MANAGING
      // ----------------------------------------------------------

      case 'grocery managing':
        return [
          {
            'name': 'Kannan Grocery Services',
            'skill': 'Grocery Purchase & Management',
            'rating': '4.9',
            'reviews': '102 reviews',
            'distance': '1.0 km',
            'availability': 'Available Today',
            'amount': '₹200 onwards',
            'icon': Icons.shopping_cart,
          },
          {
            'name': 'DailyNeeds Support',
            'skill': 'Household Grocery Management',
            'rating': '4.8',
            'reviews': '86 reviews',
            'distance': '1.7 km',
            'availability': 'Available Today',
            'amount': '₹180 onwards',
            'icon': Icons.shopping_cart,
          },
          {
            'name': 'Smart Grocery Helper',
            'skill': 'Grocery Shopping & Delivery',
            'rating': '4.7',
            'reviews': '68 reviews',
            'distance': '2.5 km',
            'availability': 'Available Tomorrow',
            'amount': '₹220 onwards',
            'icon': Icons.shopping_cart,
          },
        ];

      // ----------------------------------------------------------
      // CATERING
      // ----------------------------------------------------------

      case 'catering':
        return [
          {
            'name': 'Sri Annapoorna Catering',
            'skill': 'Event & Community Catering',
            'rating': '4.9',
            'reviews': '145 reviews',
            'distance': '1.5 km',
            'availability': 'Available Today',
            'amount': '₹800 onwards',
            'icon': Icons.restaurant_menu,
          },
          {
            'name': 'Coimbatore Food Services',
            'skill': 'Function & Event Catering',
            'rating': '4.8',
            'reviews': '121 reviews',
            'distance': '2.1 km',
            'availability': 'Available Today',
            'amount': '₹750 onwards',
            'icon': Icons.restaurant_menu,
          },
          {
            'name': 'TasteHub Cooperative',
            'skill': 'Community & Bulk Catering',
            'rating': '4.7',
            'reviews': '89 reviews',
            'distance': '2.9 km',
            'availability': 'Available Tomorrow',
            'amount': '₹700 onwards',
            'icon': Icons.restaurant_menu,
          },
        ];

      // ----------------------------------------------------------
      // CLOUD KITCHEN
      // ----------------------------------------------------------

      case 'cloud kitchen':
        return [
          {
            'name': 'Coimbatore Cloud Kitchen',
            'skill': 'Order-Based Food Preparation',
            'rating': '4.9',
            'reviews': '132 reviews',
            'distance': '1.3 km',
            'availability': 'Available Today',
            'amount': '₹300 onwards',
            'icon': Icons.delivery_dining,
          },
          {
            'name': 'HomeBite Kitchen',
            'skill': 'Home-Based Food Orders',
            'rating': '4.8',
            'reviews': '104 reviews',
            'distance': '2.0 km',
            'availability': 'Available Today',
            'amount': '₹280 onwards',
            'icon': Icons.delivery_dining,
          },
          {
            'name': 'FreshBox Kitchen',
            'skill': 'Fresh Meal Preparation',
            'rating': '4.7',
            'reviews': '78 reviews',
            'distance': '2.6 km',
            'availability': 'Available Tomorrow',
            'amount': '₹320 onwards',
            'icon': Icons.delivery_dining,
          },
        ];

      // ----------------------------------------------------------
      // FARM LABOUR BOOKING
      // ----------------------------------------------------------

      case 'farm labour booking':
        return [
          {
            'name': 'Kovai Farm Workers',
            'skill': 'Farm Labour & Agricultural Support',
            'rating': '4.9',
            'reviews': '156 reviews',
            'distance': '3.2 km',
            'availability': 'Available Today',
            'amount': '₹600 onwards',
            'icon': Icons.agriculture,
          },
          {
            'name': 'GreenField Labour Group',
            'skill': 'Crop & Field Work Specialist',
            'rating': '4.8',
            'reviews': '128 reviews',
            'distance': '4.1 km',
            'availability': 'Available Today',
            'amount': '₹550 onwards',
            'icon': Icons.agriculture,
          },
          {
            'name': 'Kongu Agricultural Team',
            'skill': 'Harvesting & Farm Activities',
            'rating': '4.7',
            'reviews': '97 reviews',
            'distance': '5.0 km',
            'availability': 'Available Tomorrow',
            'amount': '₹500 onwards',
            'icon': Icons.agriculture,
          },
        ];

      // ----------------------------------------------------------
      // MACHINERY RENTAL
      // ----------------------------------------------------------

      case 'machinery rental':
        return [
          {
            'name': 'Kovai Agro Equipment',
            'skill': 'Agricultural Machinery Rental',
            'rating': '4.9',
            'reviews': '88 reviews',
            'distance': '3.5 km',
            'availability': 'Available Today',
            'amount': '₹1200 onwards',
            'icon': Icons.agriculture,
          },
          {
            'name': 'FarmTech Equipment Services',
            'skill': 'Tractor & Farm Equipment',
            'rating': '4.8',
            'reviews': '72 reviews',
            'distance': '4.2 km',
            'availability': 'Available Today',
            'amount': '₹1500 onwards',
            'icon': Icons.agriculture,
          },
          {
            'name': 'Cooperative Agro Machines',
            'skill': 'Farm Machinery & Equipment',
            'rating': '4.7',
            'reviews': '61 reviews',
            'distance': '5.4 km',
            'availability': 'Available Tomorrow',
            'amount': '₹1000 onwards',
            'icon': Icons.agriculture,
          },
        ];

      // ----------------------------------------------------------
      // CROP PROTECTION SERVICES
      // ----------------------------------------------------------

      case 'crop protection services':
        return [
          {
            'name': 'GreenShield Agro Services',
            'skill': 'Pest Control & Crop Protection',
            'rating': '4.9',
            'reviews': '94 reviews',
            'distance': '3.0 km',
            'availability': 'Available Today',
            'amount': '₹700 onwards',
            'icon': Icons.eco,
          },
          {
            'name': 'FarmCare Specialists',
            'skill': 'Crop Health & Protection',
            'rating': '4.8',
            'reviews': '81 reviews',
            'distance': '4.0 km',
            'availability': 'Available Today',
            'amount': '₹650 onwards',
            'icon': Icons.eco,
          },
          {
            'name': 'AgriSafe Cooperative',
            'skill': 'Pest Management & Farm Support',
            'rating': '4.7',
            'reviews': '65 reviews',
            'distance': '5.2 km',
            'availability': 'Available Tomorrow',
            'amount': '₹600 onwards',
            'icon': Icons.eco,
          },
        ];

      default:
        return [
          {
            'name': 'Ramesh Kumar',
            'skill': 'General Service Specialist',
            'rating': '4.8',
            'reviews': '126 reviews',
            'distance': '1.2 km',
            'availability': 'Available Today',
            'amount': '₹350 onwards',
            'icon': Icons.person,
          },
          {
            'name': 'Suresh Babu',
            'skill': 'Verified Local Worker',
            'rating': '4.7',
            'reviews': '98 reviews',
            'distance': '2.1 km',
            'availability': 'Available Today',
            'amount': '₹300 onwards',
            'icon': Icons.person,
          },
          {
            'name': 'Arun Kumar',
            'skill': 'Cooperative Service Provider',
            'rating': '4.6',
            'reviews': '84 reviews',
            'distance': '2.8 km',
            'availability': 'Available Tomorrow',
            'amount': '₹320 onwards',
            'icon': Icons.person,
          },
        ];
    }
  }

  // ------------------------------------------------------------
  // SERVICE STYLE
  // ------------------------------------------------------------

  Map<String, dynamic> _serviceStyle(String service) {
    switch (service.toLowerCase()) {
      case 'electrical':
        return {
          'icon': Icons.bolt_outlined,
          'color': const Color(0xFFF4B400),
          'background': const Color(0xFFFFF6D9),
        };

      case 'carpentry':
        return {
          'icon': Icons.handyman_outlined,
          'color': const Color(0xFFE66A2C),
          'background': const Color(0xFFFFE9DF),
        };

      case 'cleaning':
        return {
          'icon': Icons.cleaning_services_outlined,
          'color': const Color(0xFF2BA84A),
          'background': const Color(0xFFE8F8EC),
        };

      case 'appliance repair':
        return {
          'icon': Icons.kitchen_outlined,
          'color': const Color(0xFF1976D2),
          'background': const Color(0xFFE6F0FF),
        };

      case 'painting':
        return {
          'icon': Icons.format_paint_outlined,
          'color': const Color(0xFFE53935),
          'background': const Color(0xFFFFE8E8),
        };

      case 'gardening':
        return {
          'icon': Icons.local_florist_outlined,
          'color': const Color(0xFF2E9B4B),
          'background': const Color(0xFFE8F7EA),
        };

      case 'home cooking':
        return {
          'icon': Icons.restaurant,
          'color': const Color(0xFFE67E22),
          'background': const Color(0xFFFFF0E2),
        };

      case 'grocery managing':
        return {
          'icon': Icons.shopping_cart_outlined,
          'color': const Color(0xFF2E7D32),
          'background': const Color(0xFFE8F5E9),
        };

      case 'catering':
        return {
          'icon': Icons.restaurant_menu,
          'color': const Color(0xFFC62828),
          'background': const Color(0xFFFFE8E8),
        };

      case 'cloud kitchen':
        return {
          'icon': Icons.delivery_dining,
          'color': const Color(0xFF6A1B9A),
          'background': const Color(0xFFF4E8FA),
        };

      case 'farm labour booking':
        return {
          'icon': Icons.agriculture_outlined,
          'color': const Color(0xFF558B2F),
          'background': const Color(0xFFEAF5E3),
        };

      case 'machinery rental':
        return {
          'icon': Icons.agriculture,
          'color': const Color(0xFF795548),
          'background': const Color(0xFFF2E9E5),
        };

      case 'crop protection services':
        return {
          'icon': Icons.eco_outlined,
          'color': const Color(0xFF2E7D32),
          'background': const Color(0xFFE8F5E9),
        };

      case 'plumbing':
      default:
        return {
          'icon': Icons.plumbing_outlined,
          'color': const Color(0xFF00A8E8),
          'background': const Color(0xFFE6F8FF),
        };
    }
  }

  // ------------------------------------------------------------
  // WORKER CARD
  // ------------------------------------------------------------

  Widget _workerCard({
    required BuildContext context,
    required String name,
    required String skill,
    required String rating,
    required String reviews,
    required String distance,
    required String availability,
    required String amount,
    required IconData avatarIcon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  avatarIcon,
                  size: 29,
                  color: AppColors.darkBlue,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.verified,
                          size: 14,
                          color: AppColors.green,
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    Text(
                      skill,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 8.5,
                        color: AppColors.textGrey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 13,
                          color: Color(0xFFF4B400),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 8.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          reviews,
                          style: const TextStyle(
                            fontSize: 8,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F8EC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  availability,
                  style: const TextStyle(
                    fontSize: 7.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            height: 1,
            color: const Color(0xFFEAEFF4),
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 15,
                color: AppColors.textGrey,
              ),

              const SizedBox(width: 3),

              Text(
                distance,
                style: const TextStyle(
                  fontSize: 8.5,
                  color: AppColors.textGrey,
                ),
              ),

              const SizedBox(width: 12),

              const Icon(
                Icons.currency_rupee,
                size: 14,
                color: AppColors.textGrey,
              ),

              const SizedBox(width: 1),

              Text(
                amount,
                style: const TextStyle(
                  fontSize: 8.5,
                  color: AppColors.textGrey,
                ),
              ),

              const Spacer(),

              SizedBox(
                height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/worker-profile',
                      arguments: {
                        'name': name,
                        'skill': skill,
                        'rating': rating,
                        'reviews': reviews,
                        'distance': distance,
                        'availability': availability,
                        'amount': amount,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Text(
                    'View Profile',
                    style: TextStyle(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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

                Navigator.pushNamed(
                  context,
                  item.$3,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.$2,
                    size: 19,
                    color: AppColors.textGrey,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.$1,
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
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