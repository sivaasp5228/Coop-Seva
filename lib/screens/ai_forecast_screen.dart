import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AIForecastScreen extends StatefulWidget {
  const AIForecastScreen({super.key});

  @override
  State<AIForecastScreen> createState() => _AIForecastScreenState();
}

class _AIForecastScreenState extends State<AIForecastScreen> {
  String selectedService = 'All Services';
  String selectedPeriod = '7 Days';

  final List<String> services = [
    'All Services',
    'Plumbing',
    'Electrical',
    'Cleaning',
    'Carpentry',
    'Painting',
    'Gardening',
  ];

  final List<String> periods = [
    '7 Days',
    '14 Days',
    '30 Days',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Demand Forecast',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cooperative Workforce Analytics',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Forecast data refreshed'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAIHeader(),

            const SizedBox(height: 18),

            _buildFilters(),

            const SizedBox(height: 20),

            _buildForecastSummary(),

            const SizedBox(height: 22),

            const Text(
              'Demand Trend',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 12),

            _buildDemandChart(),

            const SizedBox(height: 24),

            const Text(
              'Service Demand Prediction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 12),

            _buildServicePrediction(
              service: 'Plumbing',
              icon: Icons.plumbing,
              predicted: 64,
              available: 42,
              demandLevel: 'High',
              percentage: 0.86,
            ),

            const SizedBox(height: 10),

            _buildServicePrediction(
              service: 'Electrical',
              icon: Icons.electrical_services,
              predicted: 52,
              available: 35,
              demandLevel: 'High',
              percentage: 0.72,
            ),

            const SizedBox(height: 10),

            _buildServicePrediction(
              service: 'Cleaning',
              icon: Icons.cleaning_services,
              predicted: 41,
              available: 38,
              demandLevel: 'Medium',
              percentage: 0.58,
            ),

            const SizedBox(height: 10),

            _buildServicePrediction(
              service: 'Carpentry',
              icon: Icons.handyman,
              predicted: 35,
              available: 31,
              demandLevel: 'Medium',
              percentage: 0.49,
            ),

            const SizedBox(height: 10),

            _buildServicePrediction(
              service: 'Painting',
              icon: Icons.format_paint,
              predicted: 28,
              available: 32,
              demandLevel: 'Low',
              percentage: 0.38,
            ),

            const SizedBox(height: 24),

            _buildWorkforceAlert(),

            const SizedBox(height: 24),

            _buildAIRecommendation(),

            const SizedBox(height: 24),

            _buildModelInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildAIHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryBlue,
            AppColors.primaryBlue.withOpacity(0.80),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 15),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Workforce Intelligence',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Predict service demand and plan worker allocation before demand increases.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        Expanded(
          child: _buildDropdown(
            value: selectedService,
            items: services,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedService = value;
                });
              }
            },
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildDropdown(
            value: selectedPeriod,
            items: periods,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedPeriod = value;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          ),
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF374151),
            fontWeight: FontWeight.w500,
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildForecastSummary() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            title: 'Predicted Jobs',
            value: '220',
            subtitle: '+18% demand',
            icon: Icons.trending_up,
            iconColor: const Color(0xFF16A34A),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildSummaryCard(
            title: 'Workers Needed',
            value: '258',
            subtitle: '38 additional',
            icon: Icons.people_alt_outlined,
            iconColor: const Color(0xFF2563EB),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: iconColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemandChart() {
    final List<double> values = [
      0.48,
      0.56,
      0.52,
      0.68,
      0.74,
      0.82,
      0.91,
    ];

    final List<String> days = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];

    return Container(
      height: 260,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Expected service requests',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B7280),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '+18%',
                  style: TextStyle(
                    color: Color(0xFF16A34A),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                values.length,
                (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${(values[index] * 100).round()}',
                            style: const TextStyle(
                              fontSize: 9,
                              color: Color(0xFF6B7280),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: values[index],
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 7),

                          Text(
                            days[index],
                            style: const TextStyle(
                              fontSize: 9,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicePrediction({
    required String service,
    required IconData icon,
    required int predicted,
    required int available,
    required String demandLevel,
    required double percentage,
  }) {
    final int shortage = predicted - available;

    Color levelColor;

    if (demandLevel == 'High') {
      levelColor = const Color(0xFFDC2626);
    } else if (demandLevel == 'Medium') {
      levelColor = const Color(0xFFD97706);
    } else {
      levelColor = const Color(0xFF16A34A);
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryBlue,
                  size: 23,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '$predicted predicted requests',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: levelColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  demandLevel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: levelColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const Text(
                'Demand',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: percentage,
                    minHeight: 7,
                    backgroundColor: const Color(0xFFE5E7EB),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      levelColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Text(
                '$available / $predicted',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),

          if (shortage > 0) ...[
            const SizedBox(height: 9),
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 15,
                  color: Color(0xFFD97706),
                ),
                const SizedBox(width: 5),
                Text(
                  '$shortage additional workers may be required',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFD97706),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildWorkforceAlert() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFED7AA),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEDD5),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFFEA580C),
              size: 24,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Workforce Shortage Alert',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9A3412),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Plumbing and electrical services may experience higher demand next week. Consider allocating additional verified workers.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF7C2D12),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIRecommendation() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.psychology,
                  color: AppColors.primaryBlue,
                  size: 23,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                'AI Recommendation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Text(
            'Based on historical bookings, service trends and current worker availability, the system recommends:',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF6B7280),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 12),

          _buildRecommendationItem(
            'Assign 12 additional plumbing workers',
          ),

          _buildRecommendationItem(
            'Assign 8 additional electrical workers',
          ),

          _buildRecommendationItem(
            'Keep 5 flexible workers available for emergency requests',
          ),

          _buildRecommendationItem(
            'Prioritize verification of pending skilled workers',
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 17,
            color: AppColors.primaryBlue,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF374151),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModelInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 20,
            color: Color(0xFF6B7280),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Demo forecast generated using simulated historical booking data. Production deployment can connect this module to the platform analytics and ML forecasting service.',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF6B7280),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}