import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/models/category_mode.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/Home/widget/tap_bar_list_view.dart';

class NewsDetailsView extends StatefulWidget {
  final CategoryModel categoryModel;

  const NewsDetailsView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder<SourceModel>(
        future: ApiManage.fetchSource(widget.categoryModel.CategoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError || snapshot.data?.status == "error") {
            return Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.hasError.toString()),
                IconButton(
                    onPressed: () {
                      ApiManage.fetchSource(widget.categoryModel.CategoryId);
                    },
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
            SourceModel ? source = snapshot.data;
            return TapBarListView(source!);
          }
        }
    );
  }
}
