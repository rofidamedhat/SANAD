import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/delete_medicine/logic/delete_medicine_cubit.dart';
import 'package:sanad/feature/medicine_schedule/logic/schedule_cubit.dart'; 
import 'days_selector_delete_dialog.dart';
import 'package:sanad/core/themeing/colors.dart';

void showConfirmDeleteDialog({
  required BuildContext context,
  required int medicineId,
  required List<String> currentDays,
}) {
  final deleteCubit = context.read<DeleteMedicineCubit>();
  final scheduleCubit = context.read<ScheduleCubit>(); 

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        content: const Text('هل تريد مسح الدواء؟', textDirection: TextDirection.rtl,),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء',style: TextStyle(color: AppColors.green69),),
          ),
          SizedBox(width: 80),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext); 
              
              showDaysSelectorDeleteDialog(
                context: context,
                medicineId: medicineId,
                currentDays: currentDays,
                deleteMedicineCubit: deleteCubit, 
                scheduleCubit: scheduleCubit, 
              );
            },
            child: const Text('مسح', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}