import 'dart:ui';

import 'package:auth/src/utils/auth_metrics.dart';
import 'package:auth/src/utils/auth_strings.dart';
import 'package:dependency_manager/rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late RiveAnimationController _btnAnimationColtroller;

  @override
  void initState() {
    _btnAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _btnAnimationColtroller.isActive = true,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset("assets/RiveAssets/button.riv",
                controllers: [_btnAnimationColtroller]),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(width: 8),
                  Text(
                    "Start the course",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            SizedBox(
              width: 260,
              child: Column(
                children: const [
                  Text(
                    "Learn design & code",
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Don't skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            _buildButton(context),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width *
                AuthMetrics.backgroundImageWidthFactor,
            bottom: AuthMetrics.backgroundImageBottom,
            left: AuthMetrics.backgroundImageLeading,
            child: Image.asset(AuthStrings.backgroundImage),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset(AuthStrings.shapesAnimation),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AuthMetrics.blurSigma,
                sigmaY: AuthMetrics.blurSigma,
              ),
              child: const SizedBox.shrink(),
            ),
          ),
          _buildPage(context),
        ],
      ),
    );
  }
}
