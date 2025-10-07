import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/home_screen/models/top_headlines_model.dart';
import 'package:news_app/features/home_screen/services/home_screen_services.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadlineArticle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.grey));
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            TopHeadlinesModel topHeadlinesModel =
                snapshot.data! as TopHeadlinesModel;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text("no_results_found".tr()));
            }

            return Column(
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
                        imageUrl: topHeadlinesModel.articles![0].urlToImage,
                        title: topHeadlinesModel.articles![0].title.toString(),
                        authorName: topHeadlinesModel.articles![0].author
                            .toString(),
                        date: DateFormat(
                          ' dd/MM/yyyy - kk:mm ',
                        ).format(topHeadlinesModel.articles![0].publishedAt!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadlinesModel.articles!.length,
                      itemBuilder: (context, index) {
                        // TODO: Increment the index and manage exception
                        Article article = topHeadlinesModel.articles![index];
                        return ArticleCardWidget(
                          title: article.title ?? "",
                          authorName: article.author ?? "Unknown",
                          date: DateFormat(
                            'dd/MM/yyyy - kk:mm',
                          ).format(article.publishedAt!),
                          imageUrl: article.urlToImage,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text("Something went wrong!"));
        },
      ),
    );
  }
}
