import 'package:flutter/material.dart';
import 'package:news_app/models/articis_model.dart';
import 'package:news_app/pages/details/news_detalis_screen.dart';

class ArticleView extends StatelessWidget {

  Articles articisModel;

  ArticleView(this.articisModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, NewsDetailsScreen.routeName, arguments: articisModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(articisModel.urlToImage ?? "")
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                articisModel.source?.name ?? "",
                style: const TextStyle(
                  color: Color(0xFF79828B),
                  fontSize: 10,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                articisModel.title ?? "",
                style: const TextStyle(
                  color: Color(0xFF42505C),
                  fontSize: 14,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(

                articisModel.publishedAt ?? "",
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Color(0xFF79828B),
                  fontSize: 13,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
