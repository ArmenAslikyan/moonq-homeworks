import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/presentation/widgets/recipe_image_picker.dart';

class RecipesAppScreen extends StatefulWidget {
  const RecipesAppScreen({super.key});

  @override
  State<RecipesAppScreen> createState() => _RecipesAppScreenState();
}

class _RecipesAppScreenState extends State<RecipesAppScreen> {
  final nameInputController = TextEditingController();
  final categroyInputConroller = TextEditingController();
  final imagePickerKey = GlobalKey<RecipeImagePickerState>();

  List<XFile> selectedImages = [];
  final List<Map<String, Object>> savedRecipes = [];

  @override
  void dispose() {
    nameInputController.dispose();
    categroyInputConroller.dispose();
    super.dispose();
  }

  void saveRecipe() {
    savedRecipes.add({
      'title': nameInputController.text,
      'category': categroyInputConroller.text,
      'images': List<XFile>.from(selectedImages),
    });

    nameInputController.clear();
    categroyInputConroller.clear();
    imagePickerKey.currentState?.clearImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7f2f8),
      appBar: AppBar(
        title: Text(
          'Իմ Խոհարարական Գիրքը',
          style: TextStyle(
            fontWeight: FontWeight.w800
          ),
        ),
        backgroundColor: Color(0xffe7f2f8),
        centerTitle: true,
          leading: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: const Icon(Icons.arrow_back),
            ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Նոր Բաղադրատոմսի Ավելացում',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 19
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Բաղադրատոմսի Անվանում',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                          )
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: nameInputController,
                          decoration: InputDecoration(
                            hintText: 'Օրինակ՝ հավի ֆիլլե',
                            hintStyle: const TextStyle(
                                color: Color(0xffa0a0a0),
                                fontSize: 20,
                              ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                               borderSide: const BorderSide(color: Color(0xffd0dbe7), width: 1.5)
                            )
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Կատեգորիա',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                          )
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: categroyInputConroller,
                          decoration: InputDecoration(
                            hintText: 'Օրինակ՝ Հիմանական Ճաշատեսականեր',
                            hintStyle: const TextStyle(
                                color: Color(0xffa0a0a0),
                                fontSize: 20,
                              ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                               borderSide: const BorderSide(color: Color(0xffd0dbe7), width: 1.5)
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Նկարներ',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 19
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Լուսանկարներ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                          )
                        ),
                        SizedBox(height: 20),
                        RecipeImagePicker(
                          key: imagePickerKey,
                          onImagesChanged: (images) {
                            selectedImages = images;
                          },
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: saveRecipe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4caf70),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Պահպանել Բաղադրատոմսը',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}