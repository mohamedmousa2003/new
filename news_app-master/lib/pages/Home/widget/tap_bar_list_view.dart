import 'package:flutter/material.dart';
import 'package:news_app/pages/Home/widget/tap_item_api.dart';
import '../../../models/source_model.dart';
import 'article_list_view.dart';

// ignore: must_be_immutable
class TapBarListView extends StatefulWidget {
  SourceModel sourceModell;

  TapBarListView(this.sourceModell);

  @override
  State<TapBarListView> createState() => _TapBarListViewState();
}

class _TapBarListViewState extends State<TapBarListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
              length: widget.sourceModell.sources?.length ?? 0,
              initialIndex: selectedIndex,
              child: TabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                // as to delete line under select
                indicator: const BoxDecoration(),
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },
                padding: const EdgeInsets.all(12),
                isScrollable: true,
                tabs: widget.sourceModell.sources?.map((element) {
                  return TabItem(element, selectedIndex ==
                      widget.sourceModell.sources!.indexOf(element));
                }).toList() ?? [],
              )
          ),

          ArticleListView(widget.sourceModell.sources?[selectedIndex].id ?? ""),
        ],
      ),
    );
  }
}
