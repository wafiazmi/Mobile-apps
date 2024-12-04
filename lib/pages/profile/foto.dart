import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Foto extends StatefulWidget {
  const Foto({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State{
    File? imageFile;
    final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: size.width,
            height: 250,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              color: Colors.blueGrey,
              strokeWidth: 1,
              dashPattern: [5,5],
              child: SizedBox.expand(
                child: FittedBox(
                  child: imageFile != null
                  ? Image.file(File(imageFile!.path),
                  fit: BoxFit.cover) : Icon(
                    Icons.image_outlined,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
            child: SizedBox(
              width: size.width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  showPictureDialog();
                },
                child: Text('Pick Image',
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: size.width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    imageFile = null;
                  });
                },
                child: Text('Clear Image',
                style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showPictureDialog() async{
    await showDialog<void>(context: context,
    builder: (BuildContext context){
      return SimpleDialog(
        title: Text('Select Action'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              getFromCamera();
              Navigator.of(context).pop();
            },
            child: Text('Open Camera'),
          )
        ],
      );
    });
  }

  getFromCamera() async{
     final PickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
      );
      if (PickedFile != null){
        setState(() {
          imageFile = File(PickedFile.path);
        });
        }
  }
}