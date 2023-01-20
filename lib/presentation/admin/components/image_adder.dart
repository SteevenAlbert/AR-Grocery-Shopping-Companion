import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ImageAdder extends StatefulWidget {
  ImageAdder({super.key, this.label = "", this.radius = 3});
  final String label;
  final double radius;

  @override
  State<ImageAdder> createState() => _ImageAdderState();
}

class _ImageAdderState extends State<ImageAdder> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
      // print("hiii");
      // widget.imageToUpload.insert(0, '1');
    });
  }

  Future uploadImage() async {
    final filePath = "${image!.path}";
    print(filePath);
    final file = File(filePath);
    final storageRef = FirebaseStorage.instance.ref();
    storageRef.child("images/${image!.name}").putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => sourceChoice(),
          child: Container(
              height: 300,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.radius),
                  child: Container(
                    color: Colors.grey[800]!.withOpacity(0.1),
                    child: image != null
                        ? Image.network(
                            image!.path,
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          )
                        : Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(widget.label, style: Theme.of(context).textTheme.labelMedium),
        ElevatedButton(onPressed: uploadImage, child: Text("Upload Image"))
      ],
    );
  }

  void sourceChoice() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
