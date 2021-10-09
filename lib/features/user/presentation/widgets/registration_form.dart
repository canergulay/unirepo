import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/components/widgets/main_textfield_for_password.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.limitedheightUnit * 1,
        horizontal: context.limitedwidthUnit * 4,
      ),
      child: Column(
        children: [
          mainTextfield(context, hint: SentenceRepositary.shared.registerUserName),
          SizedBox(height: context.limitedheightUnit * 1.5),
          mainTextfield(context, hint: SentenceRepositary.shared.registerEmail),
          SizedBox(height: context.limitedheightUnit * 1.5),
          MainPasswordTextfield(
            passwordHint: SentenceRepositary.shared.registerPassword,
          ),
        ],
      ),
    ));
  }
}
