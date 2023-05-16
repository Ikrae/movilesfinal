import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/bookcontroller.dart';
import 'utils/BookItem.dart';
import 'details.dart';
class Books extends StatelessWidget {
  late final BookItem book;
 

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3BBB6D),
        title: Center(
            child: Text(  
          'Books on ${Get.arguments}',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Obx(() {
              return controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.getbooks.length,
                      itemBuilder: (context, index) {
                        var item = controller.getbooks[index];
                        return Card(
                          child: ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.author),
                            leading: Image.network(item.thumbnailUrl),
                            onTap: () {
                              _openDetailPage(context, item);
                            },
                          ),
                        );
                      },
                    );
            }),
          )
        ],
      )),
    );
  }

//   void _navigateToDetailsPage(BookModel book, BuildContext context) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => BookDetails(book),
//     ),
//   );
// }
  _openDetailPage(context, BookItem book) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => details(book: book)));
  }
}