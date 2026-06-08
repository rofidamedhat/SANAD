import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class AddMedicineHeader extends StatelessWidget {
  const AddMedicineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back,
                  color: AppColors.green69),
            ),
            const Spacer(),
            Center(
              child: Text(
                "إضافة دواء جديد",
                style: TextStyles.font22Black05Bold,
              ),
            ),
            const Spacer(),
          ],
        ),

        const SizedBox(height: 0),

        Center(
          child: Image.asset(
            "assets/images/medicine.png",  
            height: 180,
            width: MediaQuery.of(context).size.width*0.6,
          ),
        ),
      ],
    );
  }
}