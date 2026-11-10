import 'package:flutter/material.dart';
import '../widgets/screenshot_screen.dart';

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenshotScreen(
      asset: 'assets/ui/worker_profile.png',
      hotspots: [
        Hotspot(left: .70, top: .34, width: .28, height: .22,
            onTap: (c) => Navigator.pushNamed(c, '/booking')),
      ],
    );
  }
}
