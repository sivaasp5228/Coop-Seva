import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/government_header.dart';
import '../widgets/app_header.dart';

class VoiceRequestScreen extends StatefulWidget {
  const VoiceRequestScreen({super.key});

  @override
  State<VoiceRequestScreen> createState() => _VoiceRequestScreenState();
}

class _VoiceRequestScreenState extends State<VoiceRequestScreen> {
  bool isListening = false;
  String selectedLanguage = 'Auto Detect';

  final List<String> languages = const [
    'Auto Detect',
    'Tamil',
    'English',
    'Hindi',
    'Telugu',
    'Malayalam',
    'Kannada',
  ];

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
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _pageHeader(context),
                    const SizedBox(height: 14),

                    _introCard(),
                    const SizedBox(height: 12),

                    _languageSelector(),
                    const SizedBox(height: 18),

                    _voiceCard(),
                    const SizedBox(height: 14),

                    if (isListening) _listeningCard(),

                    if (!isListening) ...[
                      _detectedRequestCard(),
                      const SizedBox(height: 14),
                      _findWorkersButton(context),
                    ],
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
          onTap: () => Navigator.pop(context),
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
            'Service Request (Voice)',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // INTRO CARD
  // ------------------------------------------------------------

  Widget _introCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFD3E8FF),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.language,
              color: AppColors.primaryBlue,
              size: 23,
            ),
          ),

          const SizedBox(width: 11),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Speak in your preferred language',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Tamil, English, Hindi, Telugu, Malayalam, Kannada & more',
                  style: TextStyle(
                    fontSize: 9.5,
                    height: 1.35,
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
  // LANGUAGE SELECTOR
  // ------------------------------------------------------------

  Widget _languageSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Language',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),

        const SizedBox(height: 6),

        GestureDetector(
          onTap: () {
            _showLanguageSelector();
          },
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.translate,
                  size: 18,
                  color: AppColors.primaryBlue,
                ),

                const SizedBox(width: 9),

                Expanded(
                  child: Text(
                    selectedLanguage,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ),

                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 19,
                  color: AppColors.textGrey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // LANGUAGE BOTTOM SHEET
  // ------------------------------------------------------------

  void _showLanguageSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  'Select Language',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 10),

                ...languages.map(
                  (language) {
                    final selected = selectedLanguage == language;

                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        setState(() {
                          selectedLanguage = language;
                        });

                        Navigator.pop(context);
                      },
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.lightBlue
                              : const Color(0xFFF4F6F8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.language,
                          size: 19,
                          color: selected
                              ? AppColors.primaryBlue
                              : AppColors.textGrey,
                        ),
                      ),
                      title: Text(
                        language,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight:
                              selected ? FontWeight.w800 : FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                      trailing: selected
                          ? const Icon(
                              Icons.check_circle,
                              color: AppColors.primaryBlue,
                              size: 19,
                            )
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------
  // VOICE CARD
  // ------------------------------------------------------------

  Widget _voiceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Tell us what service you need',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            selectedLanguage == 'Auto Detect'
                ? 'Your language will be detected automatically'
                : 'Speaking language: $selectedLanguage',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9.5,
              color: AppColors.textGrey,
            ),
          ),

          const SizedBox(height: 18),

          GestureDetector(
            onTap: () {
              setState(() {
                isListening = !isListening;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isListening
                    ? const Color(0xFFFFE7E7)
                    : AppColors.lightBlue,
                border: Border.all(
                  color: isListening
                      ? const Color(0xFFE53935)
                      : AppColors.primaryBlue,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isListening
                        ? const Color(0x33E53935)
                        : const Color(0x330066CC),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                isListening ? Icons.stop : Icons.mic,
                size: 38,
                color: isListening
                    ? const Color(0xFFE53935)
                    : AppColors.primaryBlue,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            isListening ? 'Listening...' : 'Tap to Speak',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: isListening
                  ? const Color(0xFFE53935)
                  : AppColors.primaryBlue,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            isListening
                ? 'Speak your service requirement'
                : 'Use your preferred language',
            style: const TextStyle(
              fontSize: 9,
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // LISTENING STATE
  // ------------------------------------------------------------

  Widget _listeningCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFFFD6D6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE7E7),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Icon(
                  Icons.graphic_eq,
                  color: Color(0xFFE53935),
                  size: 18,
                ),
              ),

              const SizedBox(width: 9),

              const Expanded(
                child: Text(
                  'Listening for your request',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
              ),

              const Text(
                'LIVE',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFE53935),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _waveform(),

          const SizedBox(height: 12),

          const Text(
            'Speak naturally about the service you need.',
            style: TextStyle(
              fontSize: 9,
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // SIMULATED WAVEFORM
  // ------------------------------------------------------------

  Widget _waveform() {
    const heights = [
      10.0,
      18.0,
      28.0,
      15.0,
      35.0,
      21.0,
      42.0,
      25.0,
      16.0,
      32.0,
      22.0,
      38.0,
      17.0,
      29.0,
      12.0,
      23.0,
      34.0,
      18.0,
      27.0,
      13.0,
    ];

    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: heights.map(
          (height) {
            return Container(
              width: 3,
              height: height,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE53935),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  // ------------------------------------------------------------
  // DETECTED REQUEST
  // ------------------------------------------------------------

  Widget _detectedRequestCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.green,
                size: 19,
              ),

              SizedBox(width: 7),

              Text(
                'Detected Request',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '“எனக்கு வீட்டில் pipe leak repair செய்ய வேண்டும்.”',
              style: TextStyle(
                fontSize: 10.5,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const _RequestRow(
            icon: Icons.language,
            label: 'Detected Language',
            value: 'Tamil',
            iconColor: AppColors.primaryBlue,
          ),

          const SizedBox(height: 8),

          const _RequestRow(
            icon: Icons.build_outlined,
            label: 'Service',
            value: 'Plumbing',
            iconColor: Color(0xFF00A8E8),
          ),

          const SizedBox(height: 8),

          const _RequestRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: 'Coimbatore',
            iconColor: Colors.deepOrange,
          ),

          const SizedBox(height: 8),

          const _RequestRow(
            icon: Icons.description_outlined,
            label: 'Request Details',
            value: 'Pipe leak repair',
            iconColor: AppColors.green,
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // FIND WORKERS BUTTON
  // ------------------------------------------------------------

  Widget _findWorkersButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/workers');
        },
        icon: const Icon(
          Icons.location_searching,
          size: 18,
        ),
        label: const Text(
          'Find Nearby Workers',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
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
      ('Bookings', Icons.calendar_month_outlined, '/booking'),
      ('Messages', Icons.chat_bubble_outline, '/'),
      ('Profile', Icons.person_outline, '/worker-profile'),
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
        children: items.map(
          (item) {
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

                  if (item.$1 != 'Services' || item.$3 != '/services') {
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
          },
        ).toList(),
      ),
    );
  }
}

// ------------------------------------------------------------
// REQUEST ROW
// ------------------------------------------------------------

class _RequestRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const _RequestRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(
            icon,
            size: 16,
            color: iconColor,
          ),
        ),

        const SizedBox(width: 9),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 8,
                  color: AppColors.textGrey,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}