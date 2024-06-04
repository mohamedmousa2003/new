import 'package:flutter/material.dart';

import '../../core/api/api_manager.dart';
import '../../models/articis_model.dart';
import '../Home/widget/article_view.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      onPressed: () {
        showResults(context);
      },
      icon: Icon(Icons.search, color: Colors.black,),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder <ArticisModel>(
      future: ApiManage.fetchNewsList(searchKey: query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("suggestions");
  }

}