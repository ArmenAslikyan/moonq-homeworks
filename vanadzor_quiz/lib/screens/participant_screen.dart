import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanadzor_quiz/provider/profile_details.dart';
import 'package:vanadzor_quiz/screens/quiz_screen.dart';
import 'package:vanadzor_quiz/widgets/app_bar.dart';

class ParticipantScreen extends StatefulWidget {
  const ParticipantScreen({super.key});

  @override
  State<ParticipantScreen> createState() => _ParticipantScreenState();
}

class _ParticipantScreenState extends State<ParticipantScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121a16),
      appBar: const VanadzorQuizAppBar(showBackButton: true),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Մասնակցի Տվյալներ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Մուտքագրեք Ձեր տվյալները վարկանիշային աղյուսակում ընդգրկվելու և մրցանակներ ստանալու համար։',
                  style: TextStyle(
                    color: Color(0xffa1b6ab),
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Անուն'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Մուտքագրեք Ձեր անունը'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _surnameController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Ազգանուն'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Մուտքագրեք Ձեր ազգանունը'
                      : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      final profileDetails = context.read<ProfileDetails>();
                      profileDetails.setDetails(
                        _nameController.text,
                        _surnameController.text,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ChangeNotifierProvider.value(
                            value: profileDetails,
                            child: const QuizScreen(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff74ff9d),
                      foregroundColor: const Color(0xff003314),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Մուտք գործել',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xffa1b6ab)),
      filled: true,
      fillColor: const Color(0xff1b2921),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xff426151)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xff74ff9d), width: 2),
      ),
    );
  }
}
