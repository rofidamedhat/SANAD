import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class SignLearningCard extends StatelessWidget {
  final String label;
  final String? imageUrl;
  final Color color;

  const SignLearningCard({
    super.key,
    required this.label,
    this.imageUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.9), color.withOpacity(0.5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: const Color(0xFFF2F5F4),
                      child: const Center(
                        child: Icon(
                          Icons.pan_tool_alt_outlined,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(label, style: TextStyles.font22Black05Bold),
            ),
          ),
        ],
      ),
    );
  }
}
