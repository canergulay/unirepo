import 'package:flutter/material.dart';
import 'package:unirepo/core/components/decorations/simple_input_decoration.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/palette.dart';

Widget mainTextfield(
  BuildContext context, {
  required String hint,
  required TextEditingController controller,
  TextInputAction textInputAction = TextInputAction.next,
  bool obscure = false,
  required String? Function(String?) validator,
}) {
  //Just a simple textfield we can use in both login and register
  // Can be modified depending on the upcoming UI drawns
  return TextFormField(
    style: Theme.of(context).textTheme.bodyText1,
    obscureText: obscure,
    validator: validator,
    controller: controller,
    textInputAction: textInputAction,
    decoration: basicBlankInputDecoration(context, hint: hint),
  );
}
