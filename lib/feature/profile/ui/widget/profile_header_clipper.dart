import 'package:flutter/material.dart';

class ProfileHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // 1. نبدأ من الزاوية اللي فوق على الشمال (0,0)
    path.moveTo(0, 0);

    // 2. ننزل بخط رأسي مستقيم لحد قبل نهاية الارتفاع بـ 50 بيكسل
    // ده اللي بيخلي الجنب "مربع" مش مايل
    double sideHeight = size.height -50;
    path.lineTo(0, sideHeight);

    // 3. نرسم الكيرف (القوس) في الضلع السفلي فقط
    path.quadraticBezierTo(
      size.width / 2, // نقطة التحكم في نص العرض
      size.height ,    // بتنزل لآخر الارتفاع (رأس القوس)
      size.width,     // نقطة النهاية على اليمين
      sideHeight ,     // عند نفس مستوى بداية القوس
    );

    // 4. نطلع بخط رأسي مستقيم للزاوية اللي فوق على اليمين
    path.lineTo(size.width, 0);

    // 5. نقفل المسار (بيرجع لأول نقطة بدأنا منها تلقائياً)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}