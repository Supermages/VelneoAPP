import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velneoapp/api/modelos/api_img.dart';
import 'package:velneoapp/image/convert_images.dart';

final String exBase64 =
    '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';
final patata = ConvertImages();
File? hola;

class BottonImage extends StatefulWidget {
  final int id;
  BottonImage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<BottonImage> createState() => _BottonImageState();
}

class _BottonImageState extends State<BottonImage> {
  @override
  void initState() {
    ponerImagen();
    super.initState();
  }

  @override
  void dispose() {
    hola = null;
    super.dispose();
  }

  void ponerImagen() async {
    hola = await patata.convertBase64File(
        await ImageApi().patata(), "patata$id.png");
    //log(await ImageApi().patata(idDet: idDet));
    setState(() {});
  }

  String selectedImagePath = '';
  @override
  Widget build(BuildContext context) {
    return (hola != null)
        ? IconButton(
            iconSize: 200,
            onPressed: () async {
              await selectImage();
              setState(() {});
            },
            icon: selectedImagePath.isEmpty
                ? Image.file(
                    hola!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  )
                : Image.file(
                    File(selectedImagePath),
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
          )
        : const SizedBox(
            child: Center(child: CircularProgressIndicator()),
            height: 200,
            width: 200,
          );
  }

  Future<void> selectImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                const Text(
                  'Select Image From !',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        selectedImagePath = await selectImageFromGallery();
                        if (selectedImagePath.isNotEmpty) {
                          try {
                            Navigator.pop(context);
                            setState(() {});
                            // Convierte el archivo a Base64
                            //File file = File(selectedImagePath);

                            //log("PATATA:$file");
                          } catch (e) {
                            print('Error: $e');
                          }
                          log("PATATA:${selectedImagePath}}");
                          final hola = ConvertImages();
                          log("Base64 => ${hola.convertUbFileBase64(selectedImagePath)}");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("No Image Selected!")),
                          );
                        }
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/gallery.png',
                                height: 60,
                                width: 60,
                              ),
                              const Text('Gallery'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        selectedImagePath = await selectImageFromCamera();
                        if (selectedImagePath.isNotEmpty) {
                          Navigator.pop(context);
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("No Image Captured!")),
                          );
                        }
                      },
                      child: const Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text('Camera'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> selectImageFromGallery() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    return file?.path ?? '';
  }

  Future<String> selectImageFromCamera() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 10,
    );
    return file?.path ?? '';
  }
}
