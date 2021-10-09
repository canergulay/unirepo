import 'package:flutter/material.dart';
import 'package:unirepo/core/components/buttons/clasic_elevated_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/components/widgets/main_textfield_for_password.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/utils/user_register_login_validator.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey, child: formBody(context));
  }

  Padding formBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.limitedheightUnit * 1,
        horizontal: context.limitedwidthUnit * 4,
      ),
      child: Column(
        children: [
          textFieldsColumn(context),
          SizedBox(height: context.limitedheightUnit * 2),
          registerButton(context),
        ],
      ),
    );
  }

  ElevatedButton registerButton(BuildContext context) {
    return classicElevatedButton(
      context,
      onPressed: () {
        _formKey.currentState?.validate();
      },
      title: SentenceRepositary.shared.registerRegister,
    );
  }

  Column textFieldsColumn(BuildContext context) {
    return Column(
      children: [
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerUserName,
          validator: RegisterLoginValidator.validateUserName,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerEmail,
          validator: RegisterLoginValidator.validateEmail,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        MainPasswordTextfield(
          passwordHint: SentenceRepositary.shared.registerPassword,
          validator: RegisterLoginValidator.validatePassword,
        ),
      ],
    );
  }
}
