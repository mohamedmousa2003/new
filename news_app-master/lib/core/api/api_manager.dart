import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constant.dart';
import 'package:news_app/models/articis_model.dart';
import 'package:news_app/models/source_model.dart';

class ApiManage {
  static Future<SourceModel> fetchSource(String CategoryId) async {
    var uri = Uri.https(
      // 1-domain  2- endpoint 3- parameters
        Constant.baseUrl,
        '/v2/top-headlines/sources',
        {
          "apiKey": Constant.apiKey,
          "category": CategoryId,
        }

    );
    var response = await http.get(uri);

    var json = jsonDecode(response.body);
    SourceModel sourceData = SourceModel.fromJson(json);
    print(response.body);
    return sourceData;
  }

  static Future<ArticisModel> fetchNewsList(
      {String? sourceId, String?searchKey}) async {
    var uri = Uri.https(
        Constant.baseUrl,
        "/v2/top-headlines",
        {
          "apiKey": Constant.apiKey,
          "sources": sourceId,
          "q": searchKey,
        }
    );
    final response = await http.get(uri);
    var jsonArticls = jsonDecode(response.body);

    var articls = ArticisModel.fromJson(jsonArticls);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return articls;
    }
    else {
      throw Exception("Error fetching articls ");
    }
  }


}


