import 'package:flutter/material.dart';
import 'package:unirepo/core/components/decorations/simple_input_decoration.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/palette.dart';

Container mainTextfield(BuildContext context, {required String hint, TextInputAction textInputAction = TextInputAction.next, bool obscure = false}) {
  //Just a simple textfield we can use in both login and register
  // Can be modified depending on the upcoming UI drawns
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Palette.instance.borderRadiusGeneral), color: Colors.white),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText1,
        obscureText: obscure,
        textInputAction: textInputAction,
        decoration: basicBlankInputDecoration(context, hint: hint),
      ));
}
