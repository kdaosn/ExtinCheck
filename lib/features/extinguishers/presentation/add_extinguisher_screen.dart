import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';
import 'package:extincheck/core/widgets/common_widgets.dart';

/// Add extinguisher screen with form
class AddExtinguisherScreen extends StatefulWidget {
  const AddExtinguisherScreen({super.key});

  @override
  State<AddExtinguisherScreen> createState() => _AddExtinguisherScreenState();
}

class _AddExtinguisherScreenState extends State<AddExtinguisherScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _brandController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedType = 'PQS 6kg';
  String _selectedLocation = '';
  bool _isLoading = false;

  final List<String> _types = [
    'PQS 6kg',
    'PQS 10kg',
    'CO2 5kg',
    'CO2 10kg',
    'H2O 10L',
  ];

  @override
  void dispose() {
    _codeController.dispose();
    _brandController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Extintor agregado exitosamente')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Code field
              CustomTextField(
                label: 'Código',
                hint: 'EXT-001',
                controller: _codeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el código';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Type dropdown
              const Text(
                'Tipo',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: _types.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedType = value);
                  }
                },
              ),

              const SizedBox(height: 20),

              // Brand field
              CustomTextField(
                label: 'Marca',
                hint: 'FIREX',
                controller: _brandController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa la marca';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Location field
              const Text(
                'Ubicación',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final result = await context.push('/select-location');
                  if (result != null) {
                    setState(() => _selectedLocation = result as String);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedLocation.isEmpty
                            ? 'Seleccionar ubicación'
                            : _selectedLocation,
                        style: TextStyle(
                          color: _selectedLocation.isEmpty
                              ? AppTheme.textHint
                              : AppTheme.textPrimary,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Manufacturing date
              CustomTextField(
                label: 'Fecha de fabricación',
                hint: 'DD/MM/AAAA',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa la fecha de fabricación';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Expiry date
              CustomTextField(
                label: 'Fecha de vencimiento',
                hint: 'DD/MM/AAAA',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa la fecha de vencimiento';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Notes
              const Text(
                'Notas',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _notesController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Agregar notas adicionales...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Save button
              PrimaryButton(
                text: 'Guardar Extintor',
                onPressed: _handleSave,
                isLoading: _isLoading,
              ),

              const SizedBox(height: 12),

              // Cancel button
              SecondaryButton(text: 'Cancelar', onPressed: () => context.pop()),
            ],
          ),
        ),
      ),
    );
  }
}
