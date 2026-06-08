import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/add_medicine/logic/add_medicine_cubit.dart';
import 'package:sanad/feature/add_medicine/logic/add_medicine_state.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicineCubit, AddMedicineState>(
      listenWhen: (previous, current) =>
          current is AddMedicineLoading ||
          current is AddMedicineSuccess ||
          current is AddMedicineError,
      listener: (context, state) {
        if (state is AddMedicineLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.green69),
            ),
          );
        } else if (state is AddMedicineSuccess) {
          Navigator.pop(context); 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تمت إضافة الدواء بنجاح',style: TextStyle(color: AppColors.black05),),
              backgroundColor: AppColors.gray,
              
            ),
          );
          Navigator.pop(context); 
        } else if (state is AddMedicineError) {
          Navigator.pop(context); 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green69,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            context.read<AddMedicineCubit>().emitAddMedicineStates();
          },
          child: Center(
            child: Text(
              "إضافة",
              style: TextStyles.font20WhiteSemiBold,
            ),
          ),
        ),
      ),
    );
  }
}