import 'package:flutter/material.dart';


class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth > 1200
                ? 1200.0
                : constraints.maxWidth;
            final topHeight = width * 198 / 512;
            final bottomHeight = width * 171 / 512;

            return SingleChildScrollView(
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      height: topHeight,
                      child: Image.asset(
                        'assets/ui/confirmation_top.png',
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: width,
                          height: bottomHeight,
                          child: Image.asset(
                            'assets/ui/confirmation_bottom.png',
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Positioned(
                          left: width * .51,
                          top: bottomHeight * .55,
                          width: width * .40,
                          height: bottomHeight * .35,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.pushNamedAndRemoveUntil(
                                context, '/', (route) => false),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
