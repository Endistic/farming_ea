import 'package:farming_ea_app/views/home_page.dart';
import 'package:farming_ea_app/views/notification_page.dart';
import 'package:flutter/material.dart';

import '../models/items_model.dart';
import '../views/item_detail_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String notification = '/notification';
  static const String itemDetail = '/itemDetail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case notification:
        return _createSliceTransition(NotificationPage());
      case itemDetail:
        // รับ arguments สำหรับการแสดงข้อมูลใน ItemDetailPage
        final item = settings.arguments as Item;
        return _createSliceTransition(
            ItemDetailPage(item: item)); // ส่งข้อมูลไปที่ ItemDetailPage
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }

  // ฟังก์ชันสร้าง Slice Transition
  static PageRouteBuilder _createSliceTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // เริ่มจากทางขวา
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
