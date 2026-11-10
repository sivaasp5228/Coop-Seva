import 'package:flutter/material.dart';

typedef ScreenTap = void Function(BuildContext context);

class Hotspot {
  final double left;
  final double top;
  final double width;
  final double height;
  final ScreenTap onTap;

  const Hotspot({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.onTap,
  });
}

class ScreenshotScreen extends StatelessWidget {
  final String asset;
  final List<Hotspot> hotspots;

  const ScreenshotScreen({
    super.key,
    required this.asset,
    this.hotspots = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              final height = width * 341 / 512;

              return SizedBox(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        asset,
                        fit: BoxFit.fill,
                      ),
                    ),

                    ...hotspots.map(
                      (hotspot) {
                        return Positioned(
                          left: hotspot.left * width,
                          top: hotspot.top * height,
                          width: hotspot.width * width,
                          height: hotspot.height * height,
                          child: GestureDetector(
                            onTap: () {
                              hotspot.onTap(context);
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}