import 'package:flutter/material.dart';
import 'package:expenso/features/dashboard/view/dashboard_screen.dart';

class DashboardRoutes {
  static const String dashboard = '/dashboard';

  static final Map<String, WidgetBuilder> routes = {
    dashboard: (context) => const DashboardScreen(),
  };
}
