import 'package:flutter/material.dart';
import 'package:news_app/pages/Home/widget/article_view.dart';

import '../../../core/api/api_manager.dart';
import '../../../models/articis_model.dart';

class ArticleListView extends StatelessWidget {
  String sourceId;

  ArticleListView(this.sourceId);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder <ArticisModel>(
      future: ApiManage.fetchNewsList(sourceId: sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.hasError.toString()),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh_outlined))
            ],
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: theme.primaryColor),
          );
        }
        else {
          var articlList = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ArticleView(articlList[index]!);
              },
              itemCount: articlList.length,
            ),

          );
        }
      },
    );
  }
}
