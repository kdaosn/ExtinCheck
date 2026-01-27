import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extincheck/core/theme/app_theme.dart';
import 'package:extincheck/core/routes/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ExtinCheckApp(),
    ),
  );
}

/// Main ExtinCheck application
/// 
/// This app uses:
/// - Clean Architecture with feature-based structure
/// - Riverpod for state management
/// - GoRouter for navigation
/// - Material 3 design system
/// 
/// Features:
/// - Authentication (Splash, Login, Register)
/// - Dashboard with KPIs and charts
/// - Extinguisher management (CRUD operations)
/// - QR code scanning
/// - Company management
/// - Reports and analytics
/// - Notifications
/// - Settings
class ExtinCheckApp extends StatelessWidget {
  const ExtinCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ExtinCheck',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
