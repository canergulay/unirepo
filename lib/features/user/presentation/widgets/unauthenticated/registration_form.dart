import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/register/register_provider.dart';
import 'package:unirepo/core/components/buttons/clasic_elevated_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/components/widgets/main_textfield_for_password.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/utils/user_register_login_validator.dart';

class RegistrationForm extends StatelessWidget {
  RegistrationForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterProvider>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: formBody(context),
    );
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
      onPressed: context.read<RegisterProvider>().onRegisterButtonTap,
      title: SentenceRepositary.shared.registerRegister,
    );
  }

  Column textFieldsColumn(BuildContext context) {
    return Column(
      children: [
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerUserName,
          controller: context.read<RegisterProvider>().userNameController,
          validator: RegisterLoginValidator.validateUserName,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerEmail,
          controller: context.read<RegisterProvider>().mailController,
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
