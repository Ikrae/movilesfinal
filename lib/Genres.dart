import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/searchbook.dart';
import 'Books.dart';
import 'utils/genrecard.dart';
import 'utils/textdeco.dart';
import 'details.dart';
import 'utils/bookcontroller.dart';

class Genres extends StatelessWidget {
  bool isClicked = false;
  String name = '';
  searchbook service = searchbook();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3BBB6D),
        leading: Icon(Icons.book),
        title: Text(
          'Select Genre',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              textdeco(),
              genrecard(
                color: Colors.greenAccent,
                text: 'Fiction',
                onTap: () {
                  Get.to(() =>Books(), arguments: 'fiction');
                },
              ),
              genrecard(
                color: Colors.yellow,
                text: 'Comedy',
                onTap: () {
                  Get.to(() =>Books(), arguments: 'comedy');
                },
              ),
              genrecard(
                color: Colors.pinkAccent,
                text: 'Romance',
                onTap: () {
                  Get.to(() =>Books(), arguments: 'romance');
                },
              ),
              genrecard(
                color: Colors.redAccent,
                text: 'Drama',
                onTap: () {
                  Get.to(() =>Books(), arguments: 'drama');
                },
              ),
              genrecard(
                color: Colors.green,
                text: 'Science',
                onTap: () {
                  Get.to(() =>Books(), arguments: 'science');
                },
              ),
              genrecard(
                color: Colors.purpleAccent,
                text: 'Computers',
                onTap: () {
                  Get.to(() =>Books(), arguments: 'computers');
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                ),
              )
            ],
          ))
        ],
      )),
    );
  }
}