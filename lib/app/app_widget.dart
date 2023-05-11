import 'package:dependency_manager/asuka.dart';
import 'package:dependency_manager/flutter_modular.dart';
import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    Modular.setObservers([Asuka.asukaHeroController]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: Asuka.builder,
      title: 'Clean Animation Course',
      theme: AppTheme.of(context),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
