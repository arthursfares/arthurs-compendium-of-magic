import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref('spellcasters_images/$fileName').putFile(file);
    } on FirebaseException catch(e) {
      print(e);
    }
  }

  Future<ListResult> listFiles() async {
    ListResult results = await storage.ref('spellcasters_images').listAll();
    for (var ref in results.items) {
      print('Found file: $ref');
    }
    return results;
  }

  Future<String> downloadUrl(String imageName) async {
    String downloadUrl = await storage.ref('spellcasters_images/$imageName').getDownloadURL();
    return downloadUrl;
  }

}