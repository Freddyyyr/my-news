import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/home_screen/models/top_headlines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/search_result_screen/services/search_result_services.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "search_results".tr(),
          style: AppTextStyles.black14Semibold,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SearchResultServices().searchItemByName(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.grey));
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            ArticlesModel topHeadlinesModel = snapshot.data! as ArticlesModel;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text("no_results_found".tr()));
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadlinesModel.articles!.length,
                      itemBuilder: (context, index) {
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
