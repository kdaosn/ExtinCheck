import 'package:flutter/material.dart';
import 'package:extincheck/core/theme/app_theme.dart';

/// Notifications screen
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final notifications = [
      {
        'title': 'Extintor próximo a vencer',
        'message': 'EXT-002 vence en 30 días',
        'time': 'Hace 2 horas',
        'read': false,
        'type': 'warning',
      },
      {
        'title': 'Inspección pendiente',
        'message': 'Piso 2 - Oficina 201 requiere inspección',
        'time': 'Hace 5 horas',
        'read': false,
        'type': 'info',
      },
      {
        'title': 'Inspección completada',
        'message': 'EXT-001 inspeccionado correctamente',
        'time': 'Ayer',
        'read': true,
        'type': 'success',
      },
      {
        'title': 'Extintor vencido',
        'message': 'EXT-003 requiere atención inmediata',
        'time': 'Hace 2 días',
        'read': true,
        'type': 'error',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Mark all as read
            },
            child: const Text(
              'Marcar todo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 80,
                    color: AppTheme.textHint,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No hay notificaciones',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationItem(context, notification);
              },
            ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    Map<String, dynamic> notification,
  ) {
    final isRead = notification['read'] as bool;
    final type = notification['type'] as String;

    Color iconColor;
    IconData icon;

    switch (type) {
      case 'warning':
        iconColor = AppTheme.warningOrange;
        icon = Icons.warning;
        break;
      case 'error':
        iconColor = AppTheme.errorRed;
        icon = Icons.error;
        break;
      case 'success':
        iconColor = AppTheme.successGreen;
        icon = Icons.check_circle;
        break;
      default:
        iconColor = AppTheme.accentBlue;
        icon = Icons.info;
    }

    return Container(
      color: isRead
          ? Colors.white
          : AppTheme.primaryRed.withValues(alpha: 0.05),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          notification['title'] as String,
          style: TextStyle(
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification['message'] as String),
            const SizedBox(height: 4),
            Text(
              notification['time'] as String,
              style: const TextStyle(fontSize: 12, color: AppTheme.textHint),
            ),
          ],
        ),
        trailing: !isRead
            ? Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryRed,
                  shape: BoxShape.circle,
                ),
              )
            : null,
        onTap: () {
          // TODO: Mark as read and navigate to detail
        },
      ),
    );
  }
}
