import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class TopHeadlineItemWidget extends StatelessWidget {
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;

  const TopHeadlineItemWidget({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://img.freepik.com/free-vector/people-showcasing-different-types-ways-access-news_53876-43017.jpg?semt=ais_hybrid&w=740&q=80",
              height: 206.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: AppTextStyles.titleStyles.copyWith(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text("$authorName - $date", style: AppTextStyles.grey14Regular),
      ],
    );
  }
}
