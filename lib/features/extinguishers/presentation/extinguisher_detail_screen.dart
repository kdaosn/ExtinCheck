import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';
import 'package:extincheck/core/widgets/common_widgets.dart';

/// Extinguisher detail screen
class ExtinguisherDetailScreen extends StatelessWidget {
  final String extinguisherId;
  
  const ExtinguisherDetailScreen({
    super.key,
    required this.extinguisherId,
  });

  @override
  Widget build(BuildContext context) {
    // Mock data
    final extinguisher = {
      'id': extinguisherId,
      'code': 'EXT-001',
      'type': 'PQS 6kg',
      'brand': 'FIREX',
      'location': 'Piso 1 - Pasillo A',
      'status': 'Vigente',
      'lastInspection': '15/01/2026',
      'nextInspection': '15/07/2026',
      'manufacturingDate': '10/03/2023',
      'expiryDate': '10/03/2033',
      'pressure': 'Normal',
      'notes': 'Extintor en buenas condiciones',
    };
    
    return Scaffold(
      appBar: AppBar(
        title: Text(extinguisher['code']!),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/extinguishers/edit/$extinguisherId'),
          ),
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {
              // Show QR code
              _showQrCodeDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryRed.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.fire_extinguisher,
                      size: 60,
                      color: AppTheme.primaryRed,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    extinguisher['code']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  StatusBadge(status: extinguisher['status']!),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Information sections
            _buildSection(
              'Información General',
              [
                _buildInfoRow('Tipo', extinguisher['type']!),
                _buildInfoRow('Marca', extinguisher['brand']!),
                _buildInfoRow('Ubicación', extinguisher['location']!),
                _buildInfoRow('Presión', extinguisher['pressure']!),
              ],
            ),
            
            _buildSection(
              'Fechas',
              [
                _buildInfoRow('Fabricación', extinguisher['manufacturingDate']!),
                _buildInfoRow('Vencimiento', extinguisher['expiryDate']!),
                _buildInfoRow('Última inspección', extinguisher['lastInspection']!),
                _buildInfoRow('Próxima inspección', extinguisher['nextInspection']!),
              ],
            ),
            
            _buildSection(
              'Notas',
              [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    extinguisher['notes']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            
            _buildSection(
              'Historial de Inspecciones',
              [
                _buildInspectionHistoryItem(
                  '15/01/2026',
                  'Juan Pérez',
                  'Inspección mensual - Todo en orden',
                ),
                _buildInspectionHistoryItem(
                  '15/12/2025',
                  'María González',
                  'Inspección mensual - Todo en orden',
                ),
                _buildInspectionHistoryItem(
                  '15/11/2025',
                  'Juan Pérez',
                  'Inspección mensual - Se corrigió presión',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Action buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Realizar Inspección',
                    onPressed: () {
                      // TODO: Navigate to inspection form
                    },
                  ),
                  const SizedBox(height: 12),
                  SecondaryButton(
                    text: 'Generar Reporte',
                    onPressed: () {
                      // TODO: Generate PDF report
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

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInspectionHistoryItem(String date, String inspector, String notes) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.backgroundGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                inspector,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            notes,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  void _showQrCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Código QR'),
        content: Container(
          width: 200,
          height: 200,
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.qr_code, size: 150),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
