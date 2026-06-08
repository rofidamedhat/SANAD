import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/day_selector.dart';
import 'widgets/medicine_card.dart';
import 'package:sanad/feature/add_medicine/ui/add_medicine_screen.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/feature/medicine_schedule/logic/schedule_cubit.dart';
import 'package:sanad/feature/medicine_schedule/logic/schedule_state.dart';

class MedicineScheduleScreen extends StatelessWidget {
  const MedicineScheduleScreen({super.key});


@override
Widget build(BuildContext context) {
  context.read<ScheduleCubit>().getSchedule("السبت");

  return Scaffold(
    backgroundColor: const Color(0xFFF5F5F5),
    body: SafeArea(
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: AppColors.green69),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.green69,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pushNamed(context, Routes.addMedicine),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Text('جدول الأدوية', style: TextStyles.font26green69Bold),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DaySelector(
              initialDay: "السبت",
              onDaySelected: (day) {
                context.read<ScheduleCubit>().getSchedule(day);
              },
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("دواء اليوم", style: TextStyles.font22Black05Bold),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<ScheduleCubit, ScheduleState>(
                builder: (context, state) {
                  if (state is ScheduleLoading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.green69));
                  } 
                  
                  if (state is ScheduleSuccess) {
                    final medicines = state.medicines;
                    if (medicines.isEmpty) {
                      return const Center(child: Text("لا يوجد أدوية اليوم"));
                    }

return ListView.builder(
  itemCount: medicines.length,
  itemBuilder: (context, index) {
    final med = medicines[index];
    final colors = [AppColors.greenC2, AppColors.blueE0, AppColors.orangeA6];
    return MedicineCard(
      id: med.id ?? 0,                    
      days: med.days ?? [],         
      name: med.medicineName ?? "دواء",
      time: med.time ?? "",
      note: med.notes ?? "",
      cardColor: colors[index % colors.length],
    );
  },
);
                  }

                  if (state is ScheduleError) {
                    return Center(child: Text(state.error));
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}