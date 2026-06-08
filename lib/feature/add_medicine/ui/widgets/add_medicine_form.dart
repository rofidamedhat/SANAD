import 'package:flutter/material.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/add_medicine/logic/add_medicine_cubit.dart';
import 'package:sanad/feature/add_medicine/logic/add_medicine_state.dart';
import 'package:sanad/feature/medicine_schedule/logic/schedule_cubit.dart'; 
import 'add_medicine_header.dart';
import 'custom_input_field.dart';
import 'add_button.dart';

class AddMedicineForm extends StatefulWidget {
  const AddMedicineForm({super.key});

  @override
  State<AddMedicineForm> createState() => _AddMedicineFormState();
}

class _AddMedicineFormState extends State<AddMedicineForm> {
  final List<String> weekDays = [
    "السبت", "الأحد", "الإثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة",
  ];

  Future<void> _selectTime(BuildContext context) async {
    final cubit = context.read<AddMedicineCubit>();
    
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.green69, 
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final String formattedTime = 
          "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}:00";
      
      cubit.timeController.text = formattedTime;
      setState(() {});    
    }
  }

  void _showDaysBottomSheet() {
    final cubit = context.read<AddMedicineCubit>();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: weekDays.map((day) {
                  final isSelected = cubit.selectedDays.contains(day);
                  return ChoiceChip(
                    label: Text(day),
                    selected: isSelected,
                    selectedColor: AppColors.green69,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    onSelected: (_) {
                      setModalState(() {
                        if (cubit.selectedDays.contains(day)) {
                          cubit.selectedDays.remove(day);
                        } else {
                          cubit.selectedDays.add(day);
                        }
                      });
                      setState(() {});
                    },
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddMedicineCubit>();
return BlocListener<AddMedicineCubit, AddMedicineState>(
  listener: (context, state) {
    if (state is AddMedicineSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تمت إضافة الدواء بنجاح', style: TextStyle(color: AppColors.black05)),
          backgroundColor: AppColors.gray,
        ),
      );
      Navigator.pop(context);
      
    } else if (state is AddMedicineError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error), 
          backgroundColor: Colors.red
        ),
      );
    }
  },
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddMedicineHeader(),
        const SizedBox(height: 5),

        Text("اسم الدواء :", style: TextStyles.font20green69Bold),
        const SizedBox(height: 10),
        CustomInputField(
          icon: Icons.medication,
          controller: cubit.nameController,
        ),

        const SizedBox(height: 20),

        Text("الوقت :", style: TextStyles.font20green69Bold),
        const SizedBox(height: 10),
        
        GestureDetector(
          onTap: () => _selectTime(context),
          child: AbsorbPointer(
            child: CustomInputField(
              icon: Icons.access_time,
              controller: cubit.timeController,
              hintText: cubit.timeController.text.isEmpty 
                  ? "اختر وقت الدواء" 
                  : cubit.timeController.text,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text("اي ملاحظة :", style: TextStyles.font20green69Bold),
        const SizedBox(height: 10),
        CustomInputField(
          icon: Icons.edit,
          controller: cubit.notesController,
        ),

        const SizedBox(height: 20),

        Text("يوم الدواء :", style: TextStyles.font20green69Bold),
        const SizedBox(height: 10),

        GestureDetector(
          onTap: _showDaysBottomSheet,
          child: AbsorbPointer(
            child: CustomInputField(
              icon: Icons.calendar_today,
              hintText: cubit.selectedDays.isEmpty
                  ? "اختر أيام تناول الدواء"
                  : cubit.selectedDays.join(" , "),
            ),
          ),
        ),

        const SizedBox(height: 30),

        const AddButton(),
      ],
    ),
  ),
);
  }
}