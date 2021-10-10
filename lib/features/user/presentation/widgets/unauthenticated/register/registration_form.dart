import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/register/register_provider.dart';
import 'package:unirepo/core/components/buttons/basic_text_ink_well.dart';
import 'package:unirepo/core/components/buttons/clasic_elevated_button.dart';
import 'package:unirepo/core/components/buttons/two_items_textspan.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/components/widgets/main_textfield_for_password.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/presentation/widgets/form_body.dart';
import 'package:unirepo/features/user/utils/validators/user_register_login_validator.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterManager>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: registerForm(context),
    );
  }

  Padding registerForm(BuildContext context) {
    return formBody(
      context,
      children: [
        textFieldsColumn(context),
        SizedBox(height: context.limitedheightUnit * 2),
        registerButton(context),
        SizedBox(height: context.limitedheightUnit * 2),
        registerInfoSpan(context)
      ],
    );
  }

  Column textFieldsColumn(BuildContext context) {
    return Column(
      children: [
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerUserName,
          controller: context.read<RegisterManager>().userNameController,
          validator: RegisterLoginValidator.validateUserName,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerEmail,
          controller: context.read<RegisterManager>().mailController,
          validator: RegisterLoginValidator.validateEmail,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        MainPasswordTextfield(
          passwordHint: SentenceRepositary.shared.registerPassword,
          controller: context.read<RegisterManager>().passwordController,
          validator: RegisterLoginValidator.validatePassword,
        ),
      ],
    );
  }

  ElevatedButton registerButton(BuildContext context) {
    return classicElevatedButton(
      context,
      onPressed: context.read<RegisterManager>().onRegisterButtonTap,
      title: SentenceRepositary.shared.registerRegister,
    );
  }

  RichText registerInfoSpan(BuildContext context) {
    return twoItemsTextSpan(
      context,
      firstSection: SentenceRepositary.shared.haveAlreadyAcc,
      secondSection: SentenceRepositary.shared.login,
      onPressed: () {
        context.read<PageController>().nextPage(
              duration: const Duration(milliseconds: 550),
              curve: Curves.easeInExpo,
            );
      },
    );
  }
}
