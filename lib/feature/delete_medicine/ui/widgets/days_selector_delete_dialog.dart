import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/delete_medicine_cubit.dart';
import '../../logic/delete_medicine_state.dart';
import 'package:sanad/feature/medicine_schedule/logic/schedule_cubit.dart';
import 'package:sanad/core/themeing/colors.dart';


void showDaysSelectorDeleteDialog({
  required BuildContext context,
  required int medicineId,
  required List<String> currentDays,
  required DeleteMedicineCubit deleteMedicineCubit, 
  required ScheduleCubit scheduleCubit, 
}) {
  List<String> selectedDaysToDelete = [];

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: deleteMedicineCubit),
          BlocProvider.value(value: scheduleCubit), 
        ],
        child: BlocListener<DeleteMedicineCubit, DeleteMedicineState>(
          listener: (context, state) {
            if (state is DeleteMedicineSuccessState) {
              Navigator.pop(dialogContext); 
              ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text('تم مسح الدواء بنجاح', style: TextStyle(color: AppColors.black05)),
          backgroundColor: AppColors.gray,
        ),              );
              
              final activeDay = context.read<ScheduleCubit>().currentSelectedDay;
              context.read<ScheduleCubit>().getSchedule(activeDay); 
            } else if (state is DeleteMedicineErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
              );
            }
          },
          child: StatefulBuilder(
            builder: (context, setDialogState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                title: const Text(
                  'الأيام التي تريد مسح الدواء منها :',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: currentDays.map((day) {
                      final isSelected = selectedDaysToDelete.contains(day);
                      return FilterChip(
                        label: Text(day, style: const TextStyle(fontFamily: 'Cairo')),
                        selected: isSelected,
                        selectedColor: const Color(0xff1f6e66), 
                        checkmarkColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: isSelected ? Colors.transparent : Colors.grey.shade300),
                        ),
                        onSelected: (bool value) {
                          setDialogState(() {
                            if (value) {
                              selectedDaysToDelete.add(day);
                            } else {
                              selectedDaysToDelete.remove(day);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  // زرار إلغاء
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: TextButton.styleFrom(foregroundColor: Colors.grey),
                    child: const Text('إلغاء', style: TextStyle(fontFamily: 'Cairo')),
                  ),
                  
                  BlocBuilder<DeleteMedicineCubit, DeleteMedicineState>(
                    builder: (context, state) {
                      if (state is DeleteMedicineLoadingState) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.red),
                          ),
                        );
                      }
                      return ElevatedButton(
                        onPressed: selectedDaysToDelete.isEmpty
                            ? null 
                            : () {
                                context.read<DeleteMedicineCubit>().emitDeleteMedicineStates(
                                      medicineId: medicineId,
                                      daysToDelete: selectedDaysToDelete,
                                    );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('تأكيد الحذف', style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ); // إغلاق الـ MultiBlocProvider
    }, // إغلاق الـ builder بتاعة الـ showDialog
  );
}