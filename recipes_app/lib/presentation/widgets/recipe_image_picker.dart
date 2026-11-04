import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class RecipeImagePicker extends StatefulWidget {
  const RecipeImagePicker({
    super.key,
    required this.onImagesChanged,
  });

  final ValueChanged<List<image_picker.XFile>> onImagesChanged;

  @override
  RecipeImagePickerState createState() => RecipeImagePickerState();
}

class RecipeImagePickerState extends State<RecipeImagePicker> {
  final image_picker.ImagePicker picker =
      image_picker.ImagePicker();

  List<image_picker.XFile> selectedImages = [];

  Future<void> pickImages() async {
    final List<image_picker.XFile> images =
        await picker.pickMultiImage();

    if (images.isEmpty) {
      return;
    }

    setState(() {
      selectedImages.addAll(images);
    });

    widget.onImagesChanged(List.unmodifiable(selectedImages));
  }

  void clearImages() {
    setState(() {
      selectedImages = [];
    });

    widget.onImagesChanged(const []);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedImages.length + 1,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return _UploadImageTile(
            onTap: pickImages,
          );
        }

        final image = selectedImages[index - 1];

        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            File(image.path),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class _UploadImageTile extends StatelessWidget {
  const _UploadImageTile({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xfff4f9fc),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xffb9d4e4),
              width: 1.5,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 42,
                color: Color(0xff4d829f),
              ),
              SizedBox(height: 12),
              Text(
                'Ավելացնել նկարներ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff315d75),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Ընտրել պատկերասրահից',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff7894a3),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}