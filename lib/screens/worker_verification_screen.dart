import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WorkerVerificationScreen extends StatefulWidget {
  const WorkerVerificationScreen({super.key});

  @override
  State<WorkerVerificationScreen> createState() =>
      _WorkerVerificationScreenState();
}

class _WorkerVerificationScreenState
    extends State<WorkerVerificationScreen> {
  bool isApproved = false;
  bool isRejected = false;

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
              'Worker Verification',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cooperative Administration',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusBanner(),

            const SizedBox(height: 18),

            _buildWorkerProfile(),

            const SizedBox(height: 22),

            _sectionTitle(
              Icons.badge_outlined,
              'Personal Information',
            ),

            const SizedBox(height: 10),

            _buildInfoCard(
              children: [
                _infoRow(
                  'Full Name',
                  'Arun Kumar',
                ),
                _divider(),
                _infoRow(
                  'Mobile Number',
                  '+91 98765 43210',
                ),
                _divider(),
                _infoRow(
                  'Location',
                  'Coimbatore, Tamil Nadu',
                ),
                _divider(),
                _infoRow(
                  'Cooperative',
                  'Coimbatore Labour Cooperative',
                ),
              ],
            ),

            const SizedBox(height: 22),

            _sectionTitle(
              Icons.handyman_outlined,
              'Skill Information',
            ),

            const SizedBox(height: 10),

            _buildInfoCard(
              children: [
                _infoRow(
                  'Primary Skill',
                  'Electrician',
                ),
                _divider(),
                _infoRow(
                  'Experience',
                  '6 Years',
                ),
                _divider(),
                _infoRow(
                  'Service Area',
                  'Coimbatore - 10 km radius',
                ),
                _divider(),
                _infoRow(
                  'Availability',
                  'Full Time',
                ),
              ],
            ),

            const SizedBox(height: 22),

            _sectionTitle(
              Icons.description_outlined,
              'Verification Documents',
            ),

            const SizedBox(height: 10),

            _buildDocumentCard(
              title: 'Identity Proof',
              subtitle: 'Government ID',
              icon: Icons.credit_card,
              verified: true,
            ),

            const SizedBox(height: 10),

            _buildDocumentCard(
              title: 'Skill Certificate',
              subtitle: 'Electrical Technician Certificate',
              icon: Icons.workspace_premium_outlined,
              verified: true,
            ),

            const SizedBox(height: 10),

            _buildDocumentCard(
              title: 'Address Proof',
              subtitle: 'Residential verification document',
              icon: Icons.home_work_outlined,
              verified: true,
            ),

            const SizedBox(height: 22),

            _sectionTitle(
              Icons.fact_check_outlined,
              'Verification Checklist',
            ),

            const SizedBox(height: 10),

            _buildChecklist(),

            const SizedBox(height: 22),

            _buildAdminNote(),
          ],
        ),
      ),

      bottomNavigationBar:
          isApproved || isRejected ? null : _buildActionArea(),
    );
  }

  Widget _buildStatusBanner() {
    Color background;
    Color foreground;
    IconData icon;
    String title;
    String subtitle;

    if (isApproved) {
      background = const Color(0xFFECFDF5);
      foreground = const Color(0xFF15803D);
      icon = Icons.verified;
      title = 'Worker Approved';
      subtitle =
          'This worker is now verified and eligible to receive service requests.';
    } else if (isRejected) {
      background = const Color(0xFFFEF2F2);
      foreground = const Color(0xFFDC2626);
      icon = Icons.cancel_outlined;
      title = 'Application Rejected';
      subtitle =
          'The worker application has been marked as rejected.';
    } else {
      background = const Color(0xFFFFF7ED);
      foreground = const Color(0xFFEA580C);
      icon = Icons.pending_actions;
      title = 'Verification Pending';
      subtitle =
          'Review the worker information and documents before approval.';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: foreground.withOpacity(0.20),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: foreground,
            size: 27,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: foreground,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.35,
                    color: foreground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkerProfile() {
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
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.20),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 40,
              color: AppColors.primaryBlue,
            ),
          ),

          const SizedBox(width: 15),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Arun Kumar',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Electrician',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4B5563),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Color(0xFF6B7280),
                    ),
                    SizedBox(width: 3),
                    Text(
                      'Coimbatore',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
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
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'PENDING',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEA580C),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(
    IconData icon,
    String title,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primaryBlue,
          size: 21,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _infoRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      color: Color(0xFFF0F0F0),
    );
  }

  Widget _buildDocumentCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool verified,
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
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.17),
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
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          if (verified)
            const Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Color(0xFF16A34A),
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  'Valid',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16A34A),
                  ),
                ),
              ],
            ),

          const SizedBox(width: 7),

          const Icon(
            Icons.chevron_right,
            color: Color(0xFF9CA3AF),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklist() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        children: [
          _checkItem(
            'Identity proof verified',
          ),
          _checkItem(
            'Skill certificate verified',
          ),
          _checkItem(
            'Address proof verified',
          ),
          _checkItem(
            'Cooperative membership confirmed',
          ),
          _checkItem(
            'Worker profile information reviewed',
            bottomPadding: false,
          ),
        ],
      ),
    );
  }

  Widget _checkItem(
    String title, {
    bool bottomPadding = true,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding ? 12 : 0,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF16A34A),
            size: 19,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminNote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFBFDBFE),
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.admin_panel_settings_outlined,
            color: Color(0xFF2563EB),
            size: 22,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Approval will mark this worker as verified and make the profile available for customer service bookings.',
              style: TextStyle(
                fontSize: 10,
                height: 1.4,
                color: Color(0xFF1E40AF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionArea() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          16,
          12,
          16,
          12,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E7EB),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _showRejectDialog,
                icon: const Icon(
                  Icons.close,
                  size: 18,
                ),
                label: const Text(
                  'Reject',
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFDC2626),
                  side: const BorderSide(
                    color: Color(0xFFDC2626),
                  ),
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: _showApproveDialog,
                icon: const Icon(
                  Icons.verified,
                  size: 19,
                ),
                label: const Text(
                  'Approve Worker',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16A34A),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showApproveDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.verified,
                color: Color(0xFF16A34A),
              ),
              SizedBox(width: 8),
              Text(
                'Approve Worker?',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          content: const Text(
            'Arun Kumar will become a verified cooperative worker and can receive customer bookings.',
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                setState(() {
                  isApproved = true;
                  isRejected = false;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Worker verified successfully',
                    ),
                    backgroundColor: Color(0xFF16A34A),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Approve',
              ),
            ),
          ],
        );
      },
    );
  }

  void _showRejectDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Reject Application?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: const Text(
            'This demo will mark the worker application as rejected.',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                setState(() {
                  isRejected = true;
                  isApproved = false;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Worker application rejected',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Reject',
              ),
            ),
          ],
        );
      },
    );
  }
}