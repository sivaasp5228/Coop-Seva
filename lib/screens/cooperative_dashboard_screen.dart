import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CooperativeDashboardScreen extends StatelessWidget {
  const CooperativeDashboardScreen({super.key});

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
              'Cooperative Portal',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Coimbatore Labour Cooperative',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_balance,
                color: AppColors.primaryBlue,
                size: 20,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),

            const SizedBox(height: 20),

            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 12),

            _buildStatistics(),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Worker Verification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/worker-verification',
                    );
                  },
                  child: const Text('View All'),
                ),
              ],
            ),

            const SizedBox(height: 8),

            _buildVerificationCard(
              context,
              name: 'Arun Kumar',
              skill: 'Electrician',
              location: 'Coimbatore',
              status: 'Pending',
              icon: Icons.electrical_services,
            ),

            const SizedBox(height: 10),

            _buildVerificationCard(
              context,
              name: 'Suresh R',
              skill: 'Plumber',
              location: 'RS Puram',
              status: 'Pending',
              icon: Icons.plumbing,
            ),

            const SizedBox(height: 10),

            _buildVerificationCard(
              context,
              name: 'Karthik M',
              skill: 'Carpenter',
              location: 'Gandhipuram',
              status: 'Pending',
              icon: Icons.handyman,
            ),

            const SizedBox(height: 24),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 12),

            _buildQuickActions(context),

            const SizedBox(height: 24),

            const Text(
              'Service Demand',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 12),

            _buildDemandCard(),

            const SizedBox(height: 24),

            _buildAIButton(context),
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryBlue,
            AppColors.primaryBlue.withOpacity(0.82),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.account_balance,
            color: Colors.white,
            size: 34,
          ),
          SizedBox(height: 12),
          Text(
            'Welcome, Cooperative Admin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Manage workers, verify registrations and monitor cooperative services.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.55,
      children: [
        _buildStatCard(
          title: 'Total Workers',
          value: '248',
          subtitle: 'Registered',
          icon: Icons.people_alt_outlined,
          iconColor: const Color(0xFF2563EB),
        ),
        _buildStatCard(
          title: 'Pending',
          value: '18',
          subtitle: 'Verification',
          icon: Icons.pending_actions,
          iconColor: const Color(0xFFF59E0B),
        ),
        _buildStatCard(
          title: 'Active Workers',
          value: '214',
          subtitle: 'Currently active',
          icon: Icons.verified_user_outlined,
          iconColor: const Color(0xFF16A34A),
        ),
        _buildStatCard(
          title: 'Completed Jobs',
          value: '1,286',
          subtitle: 'This month',
          icon: Icons.task_alt,
          iconColor: const Color(0xFF7C3AED),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 25,
              ),
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
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationCard(
    BuildContext context, {
    required String name,
    required String skill,
    required String location,
    required String status,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.18),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 25,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 13,
                      color: Color(0xFF6B7280),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEA580C),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/worker-verification',
                  );
                },
                child: const Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.people_outline,
            title: 'Workers',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/workers',
              );
            },
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildActionButton(
            icon: Icons.verified_outlined,
            title: 'Verification',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/worker-verification',
              );
            },
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildActionButton(
            icon: Icons.analytics_outlined,
            title: 'AI Forecast',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/ai-forecast',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemandCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        children: [
          _buildDemandRow(
            service: 'Plumbing',
            workers: '42',
            percentage: 0.82,
            icon: Icons.plumbing,
          ),

          const SizedBox(height: 15),

          _buildDemandRow(
            service: 'Electrical',
            workers: '35',
            percentage: 0.68,
            icon: Icons.electrical_services,
          ),

          const SizedBox(height: 15),

          _buildDemandRow(
            service: 'Cleaning',
            workers: '28',
            percentage: 0.55,
            icon: Icons.cleaning_services,
          ),

          const SizedBox(height: 15),

          _buildDemandRow(
            service: 'Carpentry',
            workers: '21',
            percentage: 0.42,
            icon: Icons.handyman,
          ),
        ],
      ),
    );
  }

  Widget _buildDemandRow({
    required String service,
    required String workers,
    required double percentage,
    required IconData icon,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: AppColors.primaryBlue,
            ),

            const SizedBox(width: 9),

            Expanded(
              child: Text(
                service,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Text(
              '$workers workers',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 7,
            backgroundColor: const Color(0xFFE5E7EB),
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/ai-forecast',
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 26,
              ),
            ),

            const SizedBox(width: 14),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Demand Forecast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'View predicted service demand and workforce requirements',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: const Color(0xFF9CA3AF),
      backgroundColor: Colors.white,
      elevation: 12,
      selectedFontSize: 11,
      unselectedFontSize: 10,
      onTap: (index) {
        if (index == 1) {
          Navigator.pushNamed(
            context,
            '/workers',
          );
        }

        if (index == 2) {
          Navigator.pushNamed(
            context,
            '/ai-forecast',
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          activeIcon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          activeIcon: Icon(Icons.people),
          label: 'Workers',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          activeIcon: Icon(Icons.analytics),
          label: 'Analytics',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}