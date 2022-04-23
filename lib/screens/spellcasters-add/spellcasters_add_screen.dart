import 'dart:io';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class SpellcastersAddScreen extends StatefulWidget {
  const SpellcastersAddScreen({Key? key}) : super(key: key);

  @override
  State<SpellcastersAddScreen> createState() => _SpellcastersAddScreenState();
}

class _SpellcastersAddScreenState extends State<SpellcastersAddScreen> {
  final textFieldController = TextEditingController();
  File? image = File("assets/images/euler.png");
  // PickedFile _imageFile = PickedFile("assets/images/euler.png");
  // final ImagePicker _picker = ImagePicker();

  /// Open image gallery and pick an image
  Future<XFile?> pickImageFromGallery() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  /// Pick image from gallery and return a file
  Future<File?> cropSelectedImage(String filePath) async {
    ImageCropper imageCropper = ImageCropper();

    return await imageCropper.cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      iosUiSettings: const IOSUiSettings(
        title: 'Crop Image',
        aspectRatioLockEnabled: true,
        minimumAspectRatio: 1.0,
        aspectRatioPickerButtonHidden: true,
      ),
      // androidUiSettings: AndroidUiSettings(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: FileImage(image!),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () async {
              // Step #1: Pick Image From Gallery.
              await pickImageFromGallery().then((pickedFile) async {
                // Step #2: Check if we actually picked an image. Otherwise -> stop;
                if (pickedFile == null) return;

                // Step #3: Crop earlier selected image
                await cropSelectedImage(pickedFile.path).then((croppedFile) {
                  // Step #4: Check if we actually cropped an image. Otherwise -> stop;
                  if (croppedFile == null) return;

                  // Step #5: Display image on screen
                  setState(() {
                    image = croppedFile;
                  });
                });
              });
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  // Widget bottomSheet() {
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: const EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         const Text(
  //           "Choose Profile photo",
  //           style: TextStyle(
  //             fontSize: 20.0,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  //           TextButton.icon(
  //             icon: const Icon(Icons.camera),
  //             onPressed: () {
  //               takePhoto(ImageSource.camera);
  //             },
  //             label: const Text("Camera"),
  //           ),
  //           TextButton.icon(
  //             icon: const Icon(Icons.image),
  //             onPressed: () {
  //               takePhoto(ImageSource.gallery);
  //             },
  //             label: const Text("Gallery"),
  //           ),
  //         ])
  //       ],
  //     ),
  //   );
  // }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile as PickedFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int _currentLevel = 1;
    String dropdownValue = 'Wizard';
    List<String> dndClasses = [
      'Wizard',
      'Warlock',
      'Sorcerer',
      'Rogue',
      'Ranger',
      'Paladin',
      'Monk',
      'Fighter',
      'Druid',
      'Cleric',
      'Bard',
      'Barbarian',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('New spellcaster'),
      ),
      body: Column(
        children: [
          // THUMBNAIL
          imageProfile(),

          // NAME
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: textFieldController,
              ),
            ),
          ),

          // CLASS
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: dndClasses.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          // LEVEL
          NumberPicker(
            axis: Axis.horizontal,
            haptics: true,
            value: _currentLevel,
            minValue: 1,
            maxValue: 20,
            onChanged: (value) => setState(() => _currentLevel = value),
          ),

          //  DESCRIPTION
          TextFormField(
            minLines: 6,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Done',
        child: const Icon(CommunityMaterialIcons.brain),
        onPressed: () {
          // TODO: add new spellcaster to list
          // for now it only adds the default one
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey[200],
            content: const Text('Spellcaster added successfully :)'),
            duration: const Duration(seconds: 3),
          ));
          Navigator.pop(context, textFieldController.text);
        },
      ),
    );
  }
}
