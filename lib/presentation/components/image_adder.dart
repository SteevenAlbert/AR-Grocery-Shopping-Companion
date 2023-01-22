import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

typedef void StringCallback(String pfpPath);

class ImageAdder extends StatefulWidget {
  ImageAdder(
      {super.key,
      required this.onImageUpload,
      this.label = "",
      this.radius = 3,
      this.url});
  final String label;
  final double radius;
  late final String? url;
  final StringCallback onImageUpload;

  @override
  State<ImageAdder> createState() => _ImageAdderState();
}

class _ImageAdderState extends State<ImageAdder> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future getImage(ImageSource media) async {
    await picker.pickImage(source: media).then((img) {
      setState(() {
        this.image = img;
        widget.onImageUpload(img!.path);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => sourceChoice(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 300,
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: Container(
                  color: Colors.grey[800]!.withOpacity(0.3),
                  child: this.image != null
                      ? Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        )
                      : (widget.url != null
                          ? Image.network(
                              widget.url!,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            )),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(widget.label, style: Theme.of(context).textTheme.labelMedium),
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
                    //if user click this button, user can FireStorage.uploadFile image from gallery
                    onPressed: () async {
                      Navigator.pop(context);
                      await getImage(ImageSource.gallery);
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
                    //if user click this button. user can FireStorage.uploadFile image from camera
                    onPressed: () async {
                      Navigator.pop(context);
                      await getImage(ImageSource.camera);
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
