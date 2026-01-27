import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';

/// Select location screen for choosing extinguisher placement
class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String? _selectedLocation;

  final List<Map<String, dynamic>> _locations = [
    {
      'floor': 'Piso 1',
      'areas': [
        'Recepción',
        'Pasillo A',
        'Pasillo B',
        'Sala de conferencias',
      ],
    },
    {
      'floor': 'Piso 2',
      'areas': [
        'Oficina 201',
        'Oficina 202',
        'Pasillo principal',
        'Sala de descanso',
      ],
    },
    {
      'floor': 'Piso 3',
      'areas': [
        'Oficina 301',
        'Pasillo principal',
        'Almacén',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Ubicación'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _locations.length,
        itemBuilder: (context, index) {
          final floor = _locations[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              title: Text(
                floor['floor'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              children: (floor['areas'] as List<String>).map((area) {
                final location = '${floor['floor']} - $area';
                final isSelected = _selectedLocation == location;
                
                return ListTile(
                  title: Text(area),
                  leading: Radio<String>(
                    value: location,
                    groupValue: _selectedLocation,
                    activeColor: AppTheme.primaryRed,
                    onChanged: (value) {
                      setState(() => _selectedLocation = value);
                    },
                  ),
                  selected: isSelected,
                  selectedTileColor: AppTheme.primaryRed.withOpacity(0.1),
                  onTap: () {
                    setState(() => _selectedLocation = location);
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: _selectedLocation != null
                ? () => context.pop(_selectedLocation)
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryRed,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Confirmar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
