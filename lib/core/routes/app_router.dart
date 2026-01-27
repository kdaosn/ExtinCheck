import 'package:go_router/go_router.dart';
import 'package:extincheck/features/auth/presentation/splash_screen.dart';
import 'package:extincheck/features/auth/presentation/login_screen.dart';
import 'package:extincheck/features/auth/presentation/register_screen.dart';
import 'package:extincheck/features/dashboard/presentation/dashboard_screen.dart';
import 'package:extincheck/features/companies/presentation/companies_screen.dart';
import 'package:extincheck/features/companies/presentation/company_detail_screen.dart';
import 'package:extincheck/features/extinguishers/presentation/extinguishers_list_screen.dart';
import 'package:extincheck/features/extinguishers/presentation/extinguisher_detail_screen.dart';
import 'package:extincheck/features/extinguishers/presentation/add_extinguisher_screen.dart';
import 'package:extincheck/features/extinguishers/presentation/edit_extinguisher_screen.dart';
import 'package:extincheck/features/extinguishers/presentation/qr_scanner_screen.dart';
import 'package:extincheck/features/extinguishers/presentation/select_location_screen.dart';
import 'package:extincheck/features/reports/presentation/reports_screen.dart';
import 'package:extincheck/features/notifications/presentation/notifications_screen.dart';
import 'package:extincheck/features/settings/presentation/settings_screen.dart';

/// GoRouter configuration for app navigation
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Auth Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    
    // Dashboard
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    
    // Companies
    GoRoute(
      path: '/companies',
      name: 'companies',
      builder: (context, state) => const CompaniesScreen(),
    ),
    GoRoute(
      path: '/companies/:id',
      name: 'companyDetail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CompanyDetailScreen(companyId: id);
      },
    ),
    
    // Extinguishers
    GoRoute(
      path: '/extinguishers',
      name: 'extinguishers',
      builder: (context, state) => const ExtinguishersListScreen(),
    ),
    GoRoute(
      path: '/extinguishers/:id',
      name: 'extinguisherDetail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ExtinguisherDetailScreen(extinguisherId: id);
      },
    ),
    GoRoute(
      path: '/extinguishers/add',
      name: 'addExtinguisher',
      builder: (context, state) => const AddExtinguisherScreen(),
    ),
    GoRoute(
      path: '/extinguishers/edit/:id',
      name: 'editExtinguisher',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return EditExtinguisherScreen(extinguisherId: id);
      },
    ),
    GoRoute(
      path: '/qr-scanner',
      name: 'qrScanner',
      builder: (context, state) => const QrScannerScreen(),
    ),
    GoRoute(
      path: '/select-location',
      name: 'selectLocation',
      builder: (context, state) => const SelectLocationScreen(),
    ),
    
    // Reports
    GoRoute(
      path: '/reports',
      name: 'reports',
      builder: (context, state) => const ReportsScreen(),
    ),
    
    // Notifications
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    
    // Settings
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
