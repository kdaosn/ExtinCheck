import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';
import 'package:extincheck/core/widgets/common_widgets.dart';

/// Company detail screen
class CompanyDetailScreen extends StatelessWidget {
  final String companyId;

  const CompanyDetailScreen({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final company = {
      'id': companyId,
      'name': 'Taco Academy',
      'address': 'Calle Principal 123',
      'phone': '+1 234 567 8900',
      'email': 'contacto@tacoacademy.com',
      'contactPerson': 'Juan Pérez',
      'totalExtinguishers': 45,
      'vigentes': 38,
      'porVencer': 5,
      'vencidos': 2,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(company['name'] as String),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Edit company
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryRed.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.restaurant,
                      size: 50,
                      color: AppTheme.primaryRed,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    company['name'] as String,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Company info
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información de Contacto',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    Icons.location_on,
                    company['address'] as String,
                  ),
                  _buildInfoRow(Icons.phone, company['phone'] as String),
                  _buildInfoRow(Icons.email, company['email'] as String),
                  _buildInfoRow(
                    Icons.person,
                    company['contactPerson'] as String,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Statistics
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estado de Extintores',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      KpiCard(
                        title: 'Total',
                        value: '${company['totalExtinguishers']}',
                        icon: Icons.fire_extinguisher,
                        color: AppTheme.primaryRed,
                      ),
                      KpiCard(
                        title: 'Vigentes',
                        value: '${company['vigentes']}',
                        icon: Icons.check_circle,
                        color: AppTheme.successGreen,
                      ),
                      KpiCard(
                        title: 'Por Vencer',
                        value: '${company['porVencer']}',
                        icon: Icons.warning,
                        color: AppTheme.warningOrange,
                      ),
                      KpiCard(
                        title: 'Vencidos',
                        value: '${company['vencidos']}',
                        icon: Icons.error,
                        color: AppTheme.errorRed,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Actions
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Ver Extintores',
                    onPressed: () => context.push('/extinguishers'),
                  ),
                  const SizedBox(height: 12),
                  SecondaryButton(
                    text: 'Generar Reporte',
                    onPressed: () {
                      // TODO: Generate company report
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.textSecondary),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
