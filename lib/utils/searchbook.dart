import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'BookItem.dart';

class searchbook {
  String genreType = Get.arguments;
  Future<List<BookItem>> getAllBooks() async {
    try {     
      print('APi Started');
      print(genreType);
      var url1 =
          'https://www.googleapis.com/books/v1/volumes?q=subject:$genreType';


      var response = await http
          .get(Uri.parse(url1))
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Unable to establish connetion . Please try again after sometime');
      });

      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      } else {
        print('Null');
        return[];
      }
    } on TimeoutException catch (_) {
      print('Response TimeOUt');
      return[];
    }
  }

List<BookItem> _parseBookJson(String jsonStr) {
  final jsonMap = convert.json.decode(jsonStr);
  if (jsonMap is Map && jsonMap['items'] is List) {
    final jsonList = jsonMap['items'] as List;
    return jsonList
        .map((jsonBook) => BookItem(
          id: jsonBook['id'],
          title: jsonBook['volumeInfo']['title'],
          author: jsonBook['volumeInfo']['authors'][0],
          description: jsonBook['volumeInfo']['description'],
          thumbnailUrl: jsonBook['volumeInfo']['imageLinks'] != null && jsonBook['volumeInfo']['imageLinks'].containsKey('smallThumbnail')
              ? jsonBook['volumeInfo']['imageLinks']['smallThumbnail']
              : null,
                        favorites: false,

        ))
        .toList();
  } else {
    return [];
  }
}
}