import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velneoapp/api/modelos/api_img.dart';
import 'package:velneoapp/dialogos/error_dialog.dart';
import 'package:velneoapp/images/image_to_base64_and!.dart';

const convertimagen = ConvertImages();
File? archivo;

class BottonImage extends StatefulWidget {
  final int id;
  const BottonImage({
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
    archivo = null;
    super.dispose();
  }

  void ponerImagen() async {
    archivo = await convertimagen.convertBase64File(
        await ImageApi().patata(), "patata$id.png");
    setState(() {});
  }

  String selectedImagePath = '';
  @override
  Widget build(BuildContext context) {
    return (archivo != null)
        ? IconButton(
            iconSize: 200,
            onPressed: () async {
              await selectImage();
              setState(() {});
            },
            icon: selectedImagePath.isEmpty
                ? Image.file(
                    archivo!,
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
            height: 200,
            width: 200,
            child: Center(child: CircularProgressIndicator()),
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
            height: MediaQuery.of(context).size.height * 0.18,
            child: Column(
              children: [
                const Text(
                  'Elige la imagen de:',
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
                          } catch (e) {
                            log('Error: $e');
                          }
                          log("Path: $selectedImagePath}");
                          log("Base64 => ${convertimagen.convertUbFileBase64(selectedImagePath)}");
                        } else {
                          showErrorDialog(
                              context, "¡No se ha seleccionado una imagen!");
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
                              const Text('Galería'),
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
                          log("Base64 => ${convertimagen.convertUbFileBase64(selectedImagePath)}");
                          setState(() {});
                        } else {
                          showErrorDialog(
                              context, "¡No se ha capturado una imagen!");
                        }
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/camera.png',
                                height: 60,
                                width: 60,
                              ),
                              const Text('Cámara'),
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
