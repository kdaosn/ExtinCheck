# ExtinCheck 🔥

Sistema de gestión y control de extintores para empresas - Aplicación móvil Flutter

## 📱 Características

- ✅ Gestión completa de extintores (CRUD)
- ✅ Escaneo de códigos QR
- ✅ Dashboard con KPIs y gráficos
- ✅ Gestión de empresas
- ✅ Reportes y estadísticas
- ✅ Historial de inspecciones
- ✅ Sistema de notificaciones
- ✅ Configuración de usuario

## 🛠️ Stack Tecnológico

- **Framework**: Flutter (Dart)
- **Arquitectura**: Clean Architecture
- **State Management**: Riverpod
- **Navegación**: GoRouter
- **UI**: Material 3
- **Charts**: fl_chart
- **QR Scanner**: mobile_scanner

## 📂 Estructura del Proyecto

```
lib/
├── core/
│   ├── theme/          # Configuración de tema
│   ├── routes/         # Navegación con GoRouter
│   └── widgets/        # Widgets reutilizables
├── features/
│   ├── auth/           # Autenticación
│   ├── dashboard/      # Panel principal
│   ├── companies/      # Gestión de empresas
│   ├── extinguishers/  # Gestión de extintores
│   ├── reports/        # Reportes
│   ├── notifications/  # Notificaciones
│   └── settings/       # Configuración
└── main.dart           # Entry point
```

## 🚀 Instalación y Ejecución

### Prerrequisitos

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### Pasos

1. **Instalar dependencias**
```bash
flutter pub get
```

2. **Verificar configuración**
```bash
flutter doctor
```

3. **Ejecutar la aplicación**
```bash
flutter run
```

## 📱 Pantallas Implementadas

1. **Autenticación**
   - Splash Screen
   - Login
   - Registro

2. **Dashboard**
   - KPIs de extintores
   - Gráficos (Pie Chart, Bar Chart)
   - Acciones rápidas

3. **Extintores**
   - Lista con búsqueda y filtros
   - Detalle completo
   - Agregar/Editar
   - Escáner QR
   - Selección de ubicación

4. **Empresas**
   - Lista de empresas
   - Detalle con estadísticas

5. **Otras**
   - Reportes
   - Notificaciones
   - Configuración

## 🎨 Diseño

La aplicación sigue el diseño Material 3 con un esquema de colores profesional:
- **Color Primario**: Rojo (#D32F2F) - Branding de seguridad
- **Color Secundario**: Azul (#1976D2)
- **Estados**: Verde (vigente), Naranja (advertencia), Rojo (vencido)

## 🔧 Configuración

### Cambiar idioma de la UI
El código está en inglés y la UI en español. Para cambiar el idioma de la UI, modifica los textos en cada pantalla.

### Integrar Firebase
El proyecto está preparado para Firebase. Sigue estos pasos:
1. Crear proyecto en Firebase Console
2. Descargar `google-services.json` (Android) y `GoogleService-Info.plist` (iOS)
3. Agregar archivos a las carpetas correspondientes
4. Instalar `firebase_core` y otros paquetes Firebase necesarios

## 📊 Datos Mock

El proyecto incluye datos de muestra en todas las pantallas. Para conectar con un backend real:
1. Crear servicios en una capa `data/`
2. Implementar repositorios
3. Conectar con providers de Riverpod
4. Reemplazar datos mock en las pantallas

## 🧪 Testing

```bash
# Ejecutar tests
flutter test

# Análisis de código
flutter analyze
```

## 📝 Convenciones de Código

- **Nombres**: 
  - Código en inglés
  - UI y textos en español
- **Arquitectura**: Clean Architecture con separación por features
- **Estado**: Riverpod para gestión de estado reactivo
- **Navegación**: GoRouter con rutas nombradas

## 🔒 Permisos Requeridos

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.CAMERA" />
```

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSCameraUsageDescription</key>
<string>Se necesita la cámara para escanear códigos QR de extintores</string>
```

## 📈 Próximos Pasos

- [ ] Integrar Firebase Authentication
- [ ] Conectar con backend REST API
- [ ] Implementar almacenamiento local (SQLite/Hive)
- [ ] Agregar modo offline
- [ ] Implementar sincronización de datos
- [ ] Agregar generación de reportes PDF
- [ ] Implementar notificaciones push

## 👨‍💻 Desarrollo

Para contribuir o desarrollar:

1. Fork el repositorio
2. Crea una rama (`git checkout -b feature/nueva-feature`)
3. Commit tus cambios (`git commit -m 'Agregar nueva feature'`)
4. Push a la rama (`git push origin feature/nueva-feature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo licencia privada para uso empresarial.

## 📞 Soporte

Para soporte y consultas, contactar al equipo de desarrollo.

---

**ExtinCheck** - Gestión profesional de extintores para empresas 🔥
