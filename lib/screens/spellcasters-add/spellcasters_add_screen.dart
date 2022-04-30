import 'dart:io';
import 'dart:ui';

import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
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
  File image = File('assets/images/larry-bird.png');
  bool usePickedImage = false;
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

  @override
  void initState() {
    super.initState();
    image = File('assets/images/larry-bird.png');
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
              color:
                  isNameEmpty ? null : const Color.fromARGB(212, 146, 84, 200),
            ),
            onPressed: isNameEmpty
                ? () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 4,
                            sigmaY: 4,
                          ),
                          child: AlertDialog(
                            backgroundColor: Colors.redAccent.shade200,
                            title: const Text(
                              'Spellcasters must have names',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    );
                  }
                : () async {
                    Navigator.pop(
                      context,
                      usePickedImage
                          ? SpellcasterModel(nameTextController.text,
                              Image.file(image), _class, _level, _description)
                          : SpellcasterModel(
                              nameTextController.text,
                              Image.asset('assets/images/larry-bird.png'),
                              _class,
                              _level,
                              _description),
                    );
                  },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          // THUMBNAIL
          Center(
            child: Stack(children: <Widget>[
              CircleAvatar(
                radius: 100.0,
                backgroundImage: usePickedImage
                    ? Image.file(image).image
                    : Image.asset('assets/images/larry-bird.png').image,
              ),
              Positioned(
                bottom: 28.0,
                right: size.width / 4 - 11.5,
                child: InkWell(
                  onTap: () async {
                    // Step #1: Pick Image From Gallery.
                    await pickImageFromGallery().then((pickedFile) async {
                      // Step #2: Check if we actually picked an image. Otherwise -> stop;
                      if (pickedFile == null) return;

                      // Step #3: Crop earlier selected image
                      await cropSelectedImage(pickedFile.path)
                          .then((croppedFile) {
                        // Step #4: Check if we actually cropped an image. Otherwise -> stop;
                        if (croppedFile == null) return;

                        // Step #5: Display image on screen
                        setState(() {
                          image = croppedFile;
                          usePickedImage = true;
                        });
                      });
                    });
                  },
                  child: const Icon(
                    // CommunityMaterialIcons.crystal_ball,
                    CommunityMaterialIcons.image_search,
                    color: Color.fromARGB(212, 146, 84, 200),
                    size: 33.0,
                  ),
                ),
              ),
            ]),
          ),

          // NAME
          SizedBox(height: size.height / 32 + 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: OutlineBorderInputField(
                labelText: 'Name',
                icon: CommunityMaterialIcons.cupcake,
                controller: nameTextController,
                onChanged: (value) {
                  setState(() {
                    isNameEmpty =
                        nameTextController.text.isEmpty ? true : false;
                  });
                },
              ),
            ),
          ),

          // CLASS & LEVEL
          SizedBox(height: size.height / 32 + 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CLASS
              SizedBox(
                height: 130,
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
                height: 130,
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
          SizedBox(height: size.height / 32 + 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context)
                    .scaffoldBackgroundColor, //background color of button
                elevation: 3, //elevation of button
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(212, 146, 84, 200),
                    width: 1.2,
                  ),
                ),
                padding:
                    const EdgeInsets.all(20) //content padding inside button
                ),
            child: const Padding(
              padding: EdgeInsets.only(left: 2.0, top: 4.0),
              child: FaIcon(
                FontAwesomeIcons.scroll,
                color: Colors.white,
                size: 23.0,
              ),
            ),
            onPressed: () {
              String originalDescription = descriptionTextController.text;

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: const Color(0xFF161616),
                    child: SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Expanded(
                                child: TextFormField(
                                  controller: descriptionTextController,
                                  minLines: 13,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  scrollPadding: const EdgeInsets.all(20.0),
                                  autofocus: true,
                                  cursorColor:
                                      const Color.fromARGB(212, 146, 84, 200),
                                  decoration: const InputDecoration(
                                    hintText: "Fireball enthusiast 🔥🔥🔥",
                                    border: InputBorder.none,
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color.fromARGB(212, 146, 84, 200),
                                    //     width: 2,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      "SAVE",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.purple.shade400,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _description =
                                            descriptionTextController.text;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor:
                                            Colors.purpleAccent.shade100,
                                        content: const Text(
                                          'Description saved successfully',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(width: 40),
                                  GestureDetector(
                                    child: Text(
                                      "DISCARD",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      descriptionTextController.text =
                                          originalDescription;
                                    },
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
