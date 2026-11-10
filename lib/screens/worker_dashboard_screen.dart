import 'package:flutter/material.dart';

import '../theme/colors.dart';

class WorkerDashboardScreen extends StatefulWidget {
  const WorkerDashboardScreen({super.key});

  @override
  State<WorkerDashboardScreen> createState() =>
      _WorkerDashboardScreenState();
}

class _WorkerDashboardScreenState extends State<WorkerDashboardScreen> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textDark,
            size: 19,
          ),
        ),
        title: const Text(
          'Worker Portal',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textDark,
              size: 25,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeCard(),
              const SizedBox(height: 18),

              _buildStats(),
              const SizedBox(height: 25),

              _buildSectionHeader(
                title: 'Service Requests',
                action: 'View All',
              ),
              const SizedBox(height: 12),

              _buildRequestCard(
                context: context,
                customer: 'Priya S.',
                service: 'Plumbing Service',
                location: 'RS Puram, Coimbatore',
                time: 'Today • 11:30 AM',
                amount: '₹450',
                icon: Icons.plumbing_outlined,
              ),

              const SizedBox(height: 12),

              _buildRequestCard(
                context: context,
                customer: 'Ramesh K.',
                service: 'Bathroom Pipe Repair',
                location: 'Gandhipuram, Coimbatore',
                time: 'Today • 2:00 PM',
                amount: '₹650',
                icon: Icons.water_drop_outlined,
              ),

              const SizedBox(height: 25),

              _buildSectionHeader(
                title: 'Upcoming Jobs',
                action: 'View All',
              ),
              const SizedBox(height: 12),

              _buildUpcomingJob(
                service: 'Water Tank Repair',
                customer: 'Arun Kumar',
                location: 'Peelamedu, Coimbatore',
                date: 'Tomorrow',
                time: '10:00 AM',
              ),

              const SizedBox(height: 12),

              _buildUpcomingJob(
                service: 'Pipe Installation',
                customer: 'Meena R.',
                location: 'Saibaba Colony',
                date: '28 Sep',
                time: '3:30 PM',
              ),

              const SizedBox(height: 25),

              _buildSectionHeader(
                title: 'Performance',
                action: 'This Month',
              ),
              const SizedBox(height: 12),

              _buildPerformanceCard(),

              const SizedBox(height: 25),

              _buildSectionHeader(
                title: 'Recent Activity',
                action: 'View All',
              ),
              const SizedBox(height: 12),

              _buildActivityCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // WELCOME CARD
  // ============================================================

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.darkBlue,
            AppColors.primaryBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.22),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.35),
                  ),
                ),
                child: const Icon(
                  Icons.person_outline_rounded,
                  color: Colors.white,
                  size: 31,
                ),
              ),

              const SizedBox(width: 13),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning, Arun 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Plumbing Specialist',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Coimbatore, Tamil Nadu',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Verified',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: isAvailable
                        ? Colors.greenAccent
                        : Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    isAvailable
                        ? 'Available for new service requests'
                        : 'Currently unavailable',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Switch(
                  value: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATISTICS
  // ============================================================

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.currency_rupee_rounded,
            value: '₹3,850',
            label: 'This Week',
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildStatCard(
            icon: Icons.work_outline_rounded,
            value: '12',
            label: 'Jobs Done',
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildStatCard(
            icon: Icons.star_rounded,
            value: '4.8',
            label: 'Rating',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.55),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 20,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION HEADER
  // ============================================================

  Widget _buildSectionHeader({
    required String title,
    required String action,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        Text(
          action,
          style: const TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SERVICE REQUEST CARD
  // ============================================================

  Widget _buildRequestCard({
    required BuildContext context,
    required String customer,
    required String service,
    required String location,
    required String time,
    required String amount,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryBlue,
                  size: 24,
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
                        color: AppColors.textDark,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      customer,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                amount,
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          Divider(
            height: 1,
            color: AppColors.border,
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.textGrey,
                size: 16,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: AppColors.textGrey,
                size: 16,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  time,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'New Request',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          Row(
            children: [
              // --------------------------------------------------
              // DECLINE BUTTON
              // --------------------------------------------------

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Request declined'),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(
                      color: Color(0xFFFFCCCC),
                    ),
                    minimumSize: const Size(0, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    'Decline',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 9),

              // --------------------------------------------------
              // ACCEPT REQUEST BUTTON
              // --------------------------------------------------

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Request accepted',
                        ),
                        duration: Duration(milliseconds: 700),
                      ),
                    );

                    Future.delayed(
                      const Duration(milliseconds: 750),
                      () {
                        if (!mounted) return;

                        Navigator.pushNamed(
                          context,
                          '/worker-booking-details',
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(0, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    'Accept Request',
                    style: TextStyle(
                      fontSize: 10,
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

  // ============================================================
  // UPCOMING JOB
  // ============================================================

  Widget _buildUpcomingJob({
    required String service,
    required String customer,
    required String location,
    required String date,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.55),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.calendar_month_outlined,
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
                  service,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  customer,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  location,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: const TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                time,
                style: const TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PERFORMANCE
  // ============================================================

  Widget _buildPerformanceCard() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _buildProgress(
            title: 'Service Completion',
            value: 0.94,
            percentage: '94%',
          ),

          const SizedBox(height: 18),

          _buildProgress(
            title: 'Customer Satisfaction',
            value: 0.96,
            percentage: '96%',
          ),

          const SizedBox(height: 18),

          _buildProgress(
            title: 'Response Rate',
            value: 0.91,
            percentage: '91%',
          ),
        ],
      ),
    );
  }

  Widget _buildProgress({
    required String title,
    required double value,
    required String percentage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Text(
              percentage,
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 7,
            backgroundColor: AppColors.lightBlue.withOpacity(0.5),
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // RECENT ACTIVITY
  // ============================================================

  Widget _buildActivityCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _buildActivity(
            icon: Icons.check_circle_outline,
            title: 'Service completed',
            subtitle: 'Kitchen Pipe Repair • Today',
          ),

          Divider(
            height: 22,
            color: AppColors.border,
          ),

          _buildActivity(
            icon: Icons.star_outline_rounded,
            title: 'Received 5-star rating',
            subtitle: 'From Priya S. • Yesterday',
          ),

          Divider(
            height: 22,
            color: AppColors.border,
          ),

          _buildActivity(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Payment received',
            subtitle: '₹650 • Bathroom Repair',
          ),
        ],
      ),
    );
  }

  Widget _buildActivity({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.lightBlue.withOpacity(0.55),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryBlue,
            size: 21,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}