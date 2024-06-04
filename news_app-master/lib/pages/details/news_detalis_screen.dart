import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/articis_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  static String routeName = "newsDetails";

  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Articles;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pattern.png"),

          fit: BoxFit.cover,
        ),
        color: Colors.white,
      ),

      child: Scaffold(
        appBar: AppBar(
          title: const Text("News Title"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(args.urlToImage ?? "")
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  args.source?.name ?? "",
                  style: const TextStyle(
                    color: Color(0xFF79828B),
                    fontSize: 10,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  args.title ?? "",
                  style: const TextStyle(
                    color: Color(0xFF42505C),
                    fontSize: 14,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(

                  args.publishedAt ?? "",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Color(0xFF79828B),
                    fontSize: 13,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(

                  args.description ?? "",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Color(0xFF79828B),
                    fontSize: 13,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      openUrl(args.url);
                    },
                    icon: Text(
                      "View Full Article", style: theme.textTheme.bodySmall,),
                    label: const Icon(Icons.play_arrow, color: Colors.black,),

                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  void openUrl(String ? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
