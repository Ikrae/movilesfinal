import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BookItem.dart';
import 'searchbook.dart';

class BookController extends GetxController {
  var getbooks = <BookItem>[].obs;
  var isLoading = true.obs;
  searchbook service = searchbook();
  @override
  void onInit() {
    callBooksList();
    super.onInit();
  }

  void callBooksList() async {
    try {
      var result = await service.getAllBooks();
      isLoading.value = true;
      if (result != null) {
        getbooks.assignAll(result);
      } else {
        print('Null');
      }
    } finally {
      isLoading.value = false;
    }

    update();
  }

 
}