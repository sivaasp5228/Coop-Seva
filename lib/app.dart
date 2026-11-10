import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/services_screen.dart';
import 'screens/workers_screen.dart';
import 'screens/worker_profile_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/worker_dashboard_screen.dart';
import 'screens/worker_booking_details_screen.dart';
import 'screens/cooperative_dashboard_screen.dart';
import 'screens/worker_verification_screen.dart';
import 'screens/ai_forecast_screen.dart';
import 'screens/voice_request_screen.dart';

class DemoUIApp extends StatelessWidget {
  const DemoUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Cooperative Digital Workforce',

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: '/login',

      routes: {
        // LOGIN
        '/login': (context) => const LoginScreen(),

        // CITIZEN
        '/': (context) => const HomeScreen(),

        '/services': (context) => const ServicesScreen(),

        '/voice-request': (context) => const VoiceRequestScreen(),

        '/workers': (context) => const WorkersScreen(),

        '/worker-profile': (context) =>
            const WorkerProfileScreen(),

        '/booking': (context) => const BookingScreen(),

        '/confirmation': (context) =>
            const ConfirmationScreen(),

        // WORKER
        '/worker-dashboard': (context) =>
            const WorkerDashboardScreen(),

        '/worker-booking-details': (context) =>
            const WorkerBookingDetailsScreen(),

        // COOPERATIVE
        '/cooperative-dashboard': (context) =>
            const CooperativeDashboardScreen(),

        '/worker-verification': (context) =>
            const WorkerVerificationScreen(),

        // AI
        '/ai-forecast': (context) =>
            const AIForecastScreen(),
      },
    );
  }
}