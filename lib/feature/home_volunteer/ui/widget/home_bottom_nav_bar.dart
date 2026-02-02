// import 'package:flutter/material.dart';
// import 'package:sanad/core/themeing/colors.dart';
// import 'package:sanad/core/themeing/text_styles.dart';

// class HomeBottomNavBar extends StatelessWidget {
//   const HomeBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, -4),
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: AppColors.green69,
//         elevation: 0,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: AppColors.whitef5,
//         selectedLabelStyle: TextStyles.font14WhiteSemiBold,
//         unselectedFontSize: 12,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             activeIcon: Icon(Icons.home),
//             label: 'الرئيسية',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_bubble_outline),
//             activeIcon: Icon(Icons.chat_bubble),
//             label: 'المحادثات',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             activeIcon: Icon(Icons.person),
//             label: 'حسابي',
//           ),
//         ],
//       ),
//     );
//   }
// }
