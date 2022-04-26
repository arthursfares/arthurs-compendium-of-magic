import 'dart:io';

import 'package:arthurs_compendium_of_magic/screens/components/outline_border_input_field.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters-add/components/custom_scroll_picker.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SpellcastersAddScreen extends StatefulWidget {
  const SpellcastersAddScreen({Key? key}) : super(key: key);

  @override
  State<SpellcastersAddScreen> createState() => _SpellcastersAddScreenState();
}

class _SpellcastersAddScreenState extends State<SpellcastersAddScreen> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  File? image = File('assets/images/euler.png');
  String _class = 'Wizard';
  int _level = 1;
  String _description = '';
  bool isNameEmpty = true;

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

  Widget imageProfile(Size contextSize) {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 100.0,
          backgroundImage: FileImage(image!),
        ),
        Positioned(
          bottom: 28.0,
          right: contextSize.width / 4 - 11.5,
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
              // CommunityMaterialIcons.crystal_ball,
              CommunityMaterialIcons.image_search,
              color: Colors.purpleAccent,
              size: 33.0,
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    descriptionTextController.text = _description;
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> dndLevels =
        List.generate(20, (index) => index + 1, growable: false);
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
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 8),
            iconSize: 30,
            disabledColor: Colors.grey,
            icon: Icon(
              Icons.check,
              color: isNameEmpty ? null : Colors.purpleAccent,
            ),
            onPressed: isNameEmpty
                ? () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('Names are important'),
                        );
                      },
                    );
                  }
                : () async {
                    // TODO: add new spellcaster to list
                    // for now it only adds the default one
                    Navigator.pop(context, nameTextController.text);
                  },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50.0),
          // THUMBNAIL
          imageProfile(size),

          // NAME
          const SizedBox(height: 20.0),
          Center(
            child: OutlineBorderInputField(
              labelText: 'Name',
              icon: CommunityMaterialIcons.cupcake,
              controller: nameTextController,
              onChanged: (value) {
                setState(() {
                  isNameEmpty = nameTextController.text.isEmpty ? true : false;
                });
              },
            ),
          ),

          // CLASS & LEVEL
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CLASS
              SizedBox(
                height: 200,
                width: 200,
                child: ScrollPicker(
                  items: dndClasses,
                  selectedItem: 'Warlock',
                  onChanged: (String value) {
                    setState(() {
                      _class = value;
                    });
                  },
                ),
              ),
              // LEVEL
              SizedBox(
                height: 200,
                width: 100,
                child: ScrollPicker(
                  items: dndLevels,
                  selectedItem: 3,
                  onChanged: (int value) {
                    setState(() {
                      _level = value;
                    });
                  },
                ),
              ),
            ],
          ),

          

          // DESCRIPTION
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black38, //background color of button
                elevation: 3, //elevation of button
                shape: const CircleBorder(),
                padding:
                    const EdgeInsets.all(18) //content padding inside button
                ),
            child: const Padding(
              padding: EdgeInsets.only(left: 4.0, top: 4.0),
              child: FaIcon(
                FontAwesomeIcons.scroll,
                color: Colors.purpleAccent,
                size: 23.0,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    child: SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Description'),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: descriptionTextController,
                                minLines: 13,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                scrollPadding: const EdgeInsets.all(20.0),
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: "Fireball enthusiast 🔥🔥🔥",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 16.0, top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _description =
                                            descriptionTextController.text;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.grey[200],
                                        content: const Text(
                                            'Description saved successfully :)'),
                                        duration: const Duration(seconds: 3),
                                      ));
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Save"),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Discard changes"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
