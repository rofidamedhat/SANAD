import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';

class DaySelector extends StatefulWidget {
  final String? initialDay;
  final Function(String) onDaySelected;
  const DaySelector({super.key, this.initialDay,required this.onDaySelected});

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  final List<String> weekDays = [
    "السبت",
    "الأحد",
    "الإثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
  ];

  late String selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDay ?? weekDays[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, index) {
          final day = weekDays[index];
          final bool isSelected = day == selectedDay;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDay = day;
                });
                widget.onDaySelected(day);
              },
              child: Container(
                width: 55,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.green69 : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}