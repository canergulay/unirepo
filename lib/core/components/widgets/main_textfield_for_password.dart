import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/register/register_provider.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';

class MainPasswordTextfield extends StatefulWidget {
  final String passwordHint;
  final String? Function(String?) validator;
  const MainPasswordTextfield({Key? key, required this.passwordHint, required this.validator}) : super(key: key);

  @override
  _MainPasswordTextfieldState createState() => _MainPasswordTextfieldState();
}

class _MainPasswordTextfieldState extends State<MainPasswordTextfield> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        mainTextfield(
          context,
          hint: widget.passwordHint,
          obscure: _obscure,
          controller: context.read<RegisterProvider>().passwordController,
          validator: widget.validator,
          textInputAction: TextInputAction.done,
        ),
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
