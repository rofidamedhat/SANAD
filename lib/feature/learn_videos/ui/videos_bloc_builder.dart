import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/learn_videos/logic/cubit/learn_videos_cubit.dart';
import 'package:sanad/feature/learn_videos/ui/videos_card.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosBody extends StatelessWidget {
  const VideosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnVideosCubit, LearnVideosState>(
      builder: (context, state) {
        if (state is LearnVideosLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LearnVideosErrorState) {
          return Center(child: Text(state.apiErrorModel.message!));
        }
        if (state is LearnVideosSuccessState) {
          final videos = state.videosList;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemCount: videos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final video = videos[index];
                return VideoCard(
                  title: video.title,
                  image:
                      "https://sanadapllication2025api.premiumasp.net${video.thumbnailUrl}",
                  onTap: () async {
                    final uri = Uri.parse(video.videoUrl);
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  },
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
