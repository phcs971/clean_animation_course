import 'dart:ui';

import 'package:auth/src/utils/auth_assets.dart';
import 'package:auth/src/utils/auth_metrics.dart';
import 'package:auth/src/utils/auth_strings.dart';
import 'package:dependency_manager/flutter_modular.dart';
import 'package:dependency_manager/rive.dart';
import 'package:ds/ds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final store = Modular.get<AuthStore>();

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: store.start,
      child: SizedBox(
        height: AuthMetrics.buttonHeight,
        width: AuthMetrics.buttonWidth,
        child: Stack(
          children: [
            RiveAnimation.asset(
              AuthAssets.buttonAnimation,
              controllers: [store.btnAnimationColtroller],
            ),
            Positioned.fill(
              top: AuthMetrics.buttonTopPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    AuthStrings.startTheCourse,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: AuthMetrics.buttonSpacing),
                  Icon(CupertinoIcons.arrow_right),
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
        padding: const EdgeInsets.symmetric(
            horizontal: AuthMetrics.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            SizedBox(
              width: AuthMetrics.buttonWidth,
              child: Column(
                children: const [
                  Text(AuthStrings.learnDesignAndCode,
                      style: AppTextStyles.hugeTitle),
                  SizedBox(height: AuthMetrics.titleSpacing),
                  Text(AuthStrings.dontSkipMessage),
                ],
              ),
            ),
            const Spacer(flex: AuthMetrics.titleFlex),
            _buildButton(context),
            const Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AuthMetrics.purchasePadding),
              child: Text(AuthStrings.purchaseMessage),
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
            child: Image.asset(AuthAssets.backgroundImage),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AuthMetrics.backgroundSigmaX,
                sigmaY: AuthMetrics.backgroundSigmaY,
              ),
            ),
          ),
          const RiveAnimation.asset(AuthAssets.shapesAnimation),
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
