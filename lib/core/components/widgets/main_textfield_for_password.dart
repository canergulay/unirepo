import 'package:flutter/material.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';

class MainPasswordTextfield extends StatefulWidget {
  final String passwordHint;
  const MainPasswordTextfield({Key? key, required this.passwordHint}) : super(key: key);

  @override
  _MainPasswordTextfieldState createState() => _MainPasswordTextfieldState();
}

class _MainPasswordTextfieldState extends State<MainPasswordTextfield> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        mainTextfield(context, hint: widget.passwordHint, obscure: _obscure),
        eyeButton(),
      ],
    );
  }

  Positioned eyeButton() => Positioned(right: 5, child: IconButton(onPressed: _onPressedEyeButton, icon: Icon(iconGetter())));

  void _onPressedEyeButton() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  IconData iconGetter() {
    if (!_obscure) {
      return Icons.remove_red_eye;
    }
    return Icons.remove_red_eye_outlined;
  }
}
