import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/register/register_provider.dart';
import 'package:unirepo/core/components/buttons/basic_text_ink_well.dart';
import 'package:unirepo/core/components/buttons/clasic_elevated_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/components/widgets/main_textfield_for_password.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/utils/user_register_login_validator.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

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
          forgetPasswordButton(context),
          SizedBox(height: context.limitedheightUnit * 1),
          registerButton(context),
          SizedBox(height: context.limitedheightUnit * 2),
          registerInfoSpan(context)
        ],
      ),
    );
  }

  Row forgetPasswordButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        basicTextInkWell(
          context,
          text: SentenceRepositary.shared.forgetpw,
          onTap: () {
            //TODO : OPEN DIALOG --> FORGET PASSWORD
          },
        ),
      ],
    );
  }

  ElevatedButton registerButton(BuildContext context) {
    return classicElevatedButton(
      context,
      onPressed: context.read<RegisterProvider>().onRegisterButtonTap,
      title: SentenceRepositary.shared.registerRegister,
    );
  }

  RichText registerInfoSpan(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: SentenceRepositary.shared.haveAlreadyAcc,
        style: Theme.of(context).textTheme.bodyText1,
        children: [
          TextSpan(
              text: SentenceRepositary.shared.login,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: TapGestureRecognizer()..onTap = () {})
        ],
      ),
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
