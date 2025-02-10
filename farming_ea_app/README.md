# farming_ea_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



lib/
├── data/
│   └── local_database.dart  # สำหรับฐานข้อมูล
├── models/
│   └── example_model.dart    # สำหรับ Model
├── controllers/
│   └── api_controller.dart   # สำหรับการเชื่อมต่อ API
├── views/
│   ├── home_page.dart        # หน้าจอหลัก
│   └── notification_page.dart # หน้าจอการแจ้งเตือน
├── providers/
│   └── state_provider.dart   # Riverpod provider
├── routes/
│   └── app_routes.dart       # จัดการ Routing
├── theme/
│   └── app_theme.dart        # Custom Theme
└── main.dart
