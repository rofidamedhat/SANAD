import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final String time;
  final String note;
  final Color cardColor;

  const MedicineCard({
    super.key,
    required this.name,
    required this.time,
    required this.note,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      height: 110,
      decoration: BoxDecoration(
        color: cardColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                time,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            note,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}