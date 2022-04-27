import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class CardOptionsDropdown extends StatelessWidget {
  const CardOptionsDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: const Color(0xFF161616),
      icon: const Icon(CommunityMaterialIcons.dots_horizontal),
      itemBuilder: (context) {
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text(
              "Edit",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text(
              "Delete",
              style: TextStyle(
                  color: Colors.red.shade800, fontWeight: FontWeight.bold),
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 0) {
          print("Edit is selected.");
        } else if (value == 1) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: const Color(0xFF161616),
              title: const Text('Confirmation'),
              content: const Text(
                  'Your about to delete a beloved character with unique magical knowlege and personal histories. \n\nAre you shure you want to continue?'),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.red.shade800),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
