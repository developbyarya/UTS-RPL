import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomizeImagePicker {
  static Future<String> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    return '';
  }

  static Widget imagePickerButton(BuildContext context, String text, {Function(String)? onImagePicked}) {
    return ElevatedButton(
      onPressed: () async {
        final imagePath = await pickImage();
        onImagePicked?.call(imagePath);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

}
