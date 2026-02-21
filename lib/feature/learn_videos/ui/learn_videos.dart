import 'package:flutter/material.dart';
import 'package:sanad/core/widgets/custom_app_bar.dart';
import 'package:sanad/feature/learn_videos/ui/videos_bloc_builder.dart';

class LearnVideosScreen extends StatelessWidget {
  const LearnVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تعلم خطوة بخطوة بالمشاهدة'),
      body: const VideosBody(),
    );
  }
}
