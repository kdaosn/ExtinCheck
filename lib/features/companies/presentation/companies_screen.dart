import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';

/// Companies list screen
class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final companies = [
      {
        'id': '1',
        'name': 'Taco Academy',
        'address': 'Calle Principal 123',
        'extinguishers': 45,
        'logo': Icons.restaurant,
      },
      {
        'id': '2',
        'name': 'Tech Solutions',
        'address': 'Av. Tecnología 456',
        'extinguishers': 32,
        'logo': Icons.computer,
      },
      {
        'id': '3',
        'name': 'Global Industries',
        'address': 'Boulevard Industrial 789',
        'extinguishers': 67,
        'logo': Icons.factory,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.primaryRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  company['logo'] as IconData,
                  color: AppTheme.primaryRed,
                ),
              ),
              title: Text(
                company['name'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(company['address'] as String),
                  const SizedBox(height: 4),
                  Text(
                    '${company['extinguishers']} extintores',
                    style: const TextStyle(
                      color: AppTheme.primaryRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.push('/companies/${company['id']}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Add company
        },
        backgroundColor: AppTheme.primaryRed,
        icon: const Icon(Icons.add),
        label: const Text('Agregar'),
      ),
    );
  }
}
