import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';
import 'package:extincheck/core/widgets/common_widgets.dart';

/// Extinguishers list screen with search and filter
class ExtinguishersListScreen extends StatefulWidget {
  const ExtinguishersListScreen({super.key});

  @override
  State<ExtinguishersListScreen> createState() =>
      _ExtinguishersListScreenState();
}

class _ExtinguishersListScreenState extends State<ExtinguishersListScreen> {
  final _searchController = TextEditingController();
  String _selectedFilter = 'Todos';

  // Mock data
  final List<Map<String, dynamic>> _extinguishers = [
    {
      'id': '1',
      'code': 'EXT-001',
      'type': 'PQS 6kg',
      'location': 'Piso 1 - Pasillo A',
      'status': 'Vigente',
      'lastInspection': '15/01/2026',
      'nextInspection': '15/07/2026',
    },
    {
      'id': '2',
      'code': 'EXT-002',
      'type': 'CO2 5kg',
      'location': 'Piso 2 - Oficina 201',
      'status': 'Próximo a vencer',
      'lastInspection': '20/07/2025',
      'nextInspection': '20/02/2026',
    },
    {
      'id': '3',
      'code': 'EXT-003',
      'type': 'PQS 6kg',
      'location': 'Piso 1 - Recepción',
      'status': 'Vencido',
      'lastInspection': '10/06/2025',
      'nextInspection': '10/12/2025',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extintores'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () => context.push('/qr-scanner'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and filter section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar por código o ubicación',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: AppTheme.backgroundGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 12),

                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('Todos'),
                      _buildFilterChip('Vigente'),
                      _buildFilterChip('Próximo a vencer'),
                      _buildFilterChip('Vencido'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Extinguishers list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _extinguishers.length,
              itemBuilder: (context, index) {
                final ext = _extinguishers[index];
                return _buildExtinguisherCard(context, ext);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/extinguishers/add'),
        backgroundColor: AppTheme.primaryRed,
        icon: const Icon(Icons.add),
        label: const Text('Agregar'),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() => _selectedFilter = label);
        },
        selectedColor: AppTheme.primaryRed.withValues(alpha: 0.2),
        checkmarkColor: AppTheme.primaryRed,
        labelStyle: TextStyle(
          color: isSelected ? AppTheme.primaryRed : AppTheme.textSecondary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildExtinguisherCard(
    BuildContext context,
    Map<String, dynamic> ext,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => context.push('/extinguishers/${ext['id']}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ext['code'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StatusBadge(status: ext['status']),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.fire_extinguisher,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    ext['type'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      ext['location'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Última inspección',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textHint,
                        ),
                      ),
                      Text(
                        ext['lastInspection'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Próxima inspección',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textHint,
                        ),
                      ),
                      Text(
                        ext['nextInspection'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
