import 'package:flutter/material.dart';
import 'widgets/add_medicine_form.dart';

class AddMedicineScreen extends StatelessWidget {
  const AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: AddMedicineForm(),
      ),
    );
  }
}