import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WorkerBookingDetailsScreen extends StatelessWidget {
  const WorkerBookingDetailsScreen({super.key});

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
          'Job Details',
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
              Icons.more_vert,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAcceptedBanner(),

              const SizedBox(height: 20),

              _buildSectionTitle('Customer Details'),
              const SizedBox(height: 11),

              _buildCustomerCard(),

              const SizedBox(height: 22),

              _buildSectionTitle('Service Details'),
              const SizedBox(height: 11),

              _buildServiceCard(),

              const SizedBox(height: 22),

              _buildSectionTitle('Schedule'),
              const SizedBox(height: 11),

              _buildScheduleCard(),

              const SizedBox(height: 22),

              _buildSectionTitle('Service Location'),
              const SizedBox(height: 11),

              _buildLocationCard(),

              const SizedBox(height: 22),

              _buildEarningsCard(),

              const SizedBox(height: 24),

              _buildContactButton(),

              const SizedBox(height: 11),

              _buildNavigateButton(),

              const SizedBox(height: 11),

              _buildStartServiceButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ACCEPTED BANNER
  // ============================================================

  Widget _buildAcceptedBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryBlue.withOpacity(0.15),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 29,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Accepted',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'You have accepted this service request.',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.textDark,
        fontSize: 17,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  // ============================================================
  // CUSTOMER CARD
  // ============================================================

  Widget _buildCustomerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(17),
            ),
            child: const Icon(
              Icons.person_outline_rounded,
              color: AppColors.primaryBlue,
              size: 30,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Priya S.',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Customer',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.verified_outlined,
                      color: AppColors.green,
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Verified Customer',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.phone_outlined,
              color: AppColors.primaryBlue,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICE CARD
  // ============================================================

  Widget _buildServiceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.plumbing_outlined,
            title: 'Service',
            value: 'Plumbing Service',
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            icon: Icons.description_outlined,
            title: 'Request Details',
            value: 'Pipe leak repair',
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            icon: Icons.home_outlined,
            title: 'Service Type',
            value: 'Home Service',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SCHEDULE CARD
  // ============================================================

  Widget _buildScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildScheduleItem(
              icon: Icons.calendar_today_outlined,
              title: 'Date',
              value: 'Today',
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: AppColors.border,
          ),
          Expanded(
            child: _buildScheduleItem(
              icon: Icons.access_time_outlined,
              title: 'Time',
              value: '11:30 AM',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primaryBlue,
          size: 22,
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textGrey,
            fontSize: 9,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // LOCATION CARD
  // ============================================================

  Widget _buildLocationCard() {
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
          Container(
            height: 125,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 18,
                  left: 25,
                  child: Icon(
                    Icons.location_city_outlined,
                    size: 55,
                    color: AppColors.primaryBlue.withOpacity(0.18),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 35,
                  child: Icon(
                    Icons.home_outlined,
                    size: 50,
                    color: AppColors.primaryBlue.withOpacity(0.18),
                  ),
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withOpacity(0.25),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primaryBlue,
                size: 19,
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  'RS Puram, Coimbatore, Tamil Nadu',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
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
  // EARNINGS
  // ============================================================

  Widget _buildEarningsCard() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.darkBlue,
            AppColors.primaryBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.currency_rupee_rounded,
              color: Colors.white,
              size: 23,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estimated Earnings',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '₹450',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Service Fee',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CONTACT BUTTON
  // ============================================================

  Widget _buildContactButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.phone_outlined,
          size: 20,
        ),
        label: const Text(
          'Contact Customer',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          side: const BorderSide(
            color: AppColors.primaryBlue,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // NAVIGATE BUTTON
  // ============================================================

  Widget _buildNavigateButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.navigation_outlined,
          size: 20,
        ),
        label: const Text(
          'Navigate to Location',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textDark,
          side: const BorderSide(
            color: AppColors.border,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // START SERVICE
  // ============================================================

  Widget _buildStartServiceButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Service started successfully',
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.play_arrow_rounded,
          size: 22,
        ),
        label: const Text(
          'Start Service',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COMMON INFO ROW
  // ============================================================

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
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
                  color: AppColors.textGrey,
                  fontSize: 9,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}