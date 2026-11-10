import 'package:flutter/material.dart';
import '../widgets/screenshot_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenshotScreen(
      asset: 'assets/ui/booking.png',
      hotspots: [
        Hotspot(left: .02, top: .01, width: .18, height: .14,
            onTap: (c) => Navigator.pop(c)),
        Hotspot(left: .55, top: .72, width: .43, height: .25,
            onTap: (c) => Navigator.pushNamed(c, '/confirmation')),
      ],
    );
  }
}
