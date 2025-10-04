import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        toolbarHeight: 80.h,
        title: Text("Explore".tr(), style: AppTextStyles.titleStyles),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Color(0xff231F20),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 32.w),
            child: SizedBox(
              height: 40.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomCategoryItemWidget(title: "travel".tr()),
                  CustomCategoryItemWidget(title: "technology".tr()),
                  CustomCategoryItemWidget(title: "business".tr()),
                  CustomCategoryItemWidget(title: "entertainment".tr()),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                TopHeadlineItemWidget(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWqWOy0nQLal_IwCJriYw56LWwNr0jNJwfVg&s",
                  title: 'Flutter',
                  authorName: 'Freddy',
                  date: '10/4/2025',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
