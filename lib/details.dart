import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'utils/BookItem.dart';
// import 'package:camera_camera/camera_camera.dart';
//camera_camera hace que no compile el proyecto
class details extends StatefulWidget {
  final BookItem book;

  details({required this.book});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  final photos = <File>[];

  late bool fav =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xFF3BBB6D),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.network(widget.book.thumbnailUrl),
                  height: 150,
                ),
                SizedBox(height: 15),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Stack(children: [
                        Text(
                          'Rating:',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            '4.5/5',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Text(
                        widget.book.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      
                      SizedBox(height: 10),
                      Text(
                        widget.book.author,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.book.description,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      IconButton(onPressed: () {
                        setState(() {
                          print(widget.book.favorites);
                          widget.book.favorites;
                          widget.book.favorites = !widget.book.favorites;
                          fav = !fav;
                        });
                        
                      },
                       icon: Icon(Icons.favorite,color: widget.book.favorites == false? Colors.grey:Colors.red,)),
                //          IconButton(onPressed: opencamera 
                            
                //          , icon: const Icon(Icons.camera_alt)
                // )
                ]))
              ],
            ),
          ]),
        ),
        
      )
      ),
    );
  }
  //   void opencamera() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (_) => CameraCamera(
  //                 onFile: (file) {
  //                   photos.add(file);
  //                   Navigator.pop(context);
  //                   setState(() {});
  //                 },
  //               )));
  // }
  


  
}