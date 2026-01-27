import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:extincheck/core/theme/app_theme.dart';

/// Settings screen
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        children: [
          // User profile section
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.white,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppTheme.primaryRed.withOpacity(0.1),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: AppTheme.primaryRed,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Juan Pérez',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'juan.perez@ejemplo.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Edit profile
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar Perfil'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryRed,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Notifications settings
          _buildSectionHeader('Notificaciones'),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Activar notificaciones'),
                  subtitle: const Text('Recibir alertas y recordatorios'),
                  value: _notificationsEnabled,
                  activeColor: AppTheme.primaryRed,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Notificaciones por correo'),
                  value: _emailNotifications,
                  activeColor: AppTheme.primaryRed,
                  onChanged: (value) {
                    setState(() => _emailNotifications = value);
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Notificaciones push'),
                  value: _pushNotifications,
                  activeColor: AppTheme.primaryRed,
                  onChanged: (value) {
                    setState(() => _pushNotifications = value);
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Sonido'),
                  value: _soundEnabled,
                  activeColor: AppTheme.primaryRed,
                  onChanged: (value) {
                    setState(() => _soundEnabled = value);
                  },
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // App settings
          _buildSectionHeader('Aplicación'),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Idioma'),
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Español'),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                  onTap: () {
                    // TODO: Change language
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Ayuda y soporte'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Help
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Acerca de'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    _showAboutDialog(context);
                  },
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Account
          _buildSectionHeader('Cuenta'),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text('Cambiar contraseña'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // TODO: Change password
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.logout, color: AppTheme.errorRed),
                  title: const Text(
                    'Cerrar sesión',
                    style: TextStyle(color: AppTheme.errorRed),
                  ),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Version info
          const Center(
            child: Text(
              'ExtinCheck v1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textHint,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Acerca de ExtinCheck'),
        content: const Text(
          'ExtinCheck v1.0.0\n\n'
          'Sistema de gestión y control de extintores para empresas.\n\n'
          '© 2026 ExtinCheck. Todos los derechos reservados.',
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/login');
            },
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.errorRed,
            ),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
