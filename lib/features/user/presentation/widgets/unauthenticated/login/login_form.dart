import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/login/login_provider.dart';
import 'package:unirepo/core/components/buttons/basic_text_ink_well.dart';
import 'package:unirepo/core/components/buttons/clasic_elevated_button.dart';
import 'package:unirepo/core/components/buttons/two_items_textspan.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/components/widgets/main_textfield_for_password.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/presentation/widgets/form_body.dart';
import 'package:unirepo/features/user/utils/validators/user_register_login_validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginManager>().loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: loginForm(context),
    );
  }

  Padding loginForm(BuildContext context) {
    return formBody(
      context,
      children: [
        mainTextfield(
          context,
          hint: SentenceRepositary.shared.registerEmail,
          controller: context.read<LoginManager>().mailController,
          validator: RegisterLoginValidator.validateEmail,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        MainPasswordTextfield(
          passwordHint: SentenceRepositary.shared.registerPassword,
          controller: context.read<LoginManager>().passwordController,
          validator: RegisterLoginValidator.validatePassword,
        ),
        SizedBox(height: context.limitedheightUnit * 1.5),
        forgetPasswordButton(context),
        SizedBox(height: context.limitedheightUnit * 1),
        loginButton(context),
        SizedBox(height: context.limitedheightUnit * 2),
        loginInfoSpan(context)
      ],
    );
  }
}

ElevatedButton loginButton(BuildContext context) {
  return classicElevatedButton(
    context,
    onPressed: context.read<LoginManager>().onLoginButtonTap,
    title: SentenceRepositary.shared.login,
  );
}

RichText loginInfoSpan(BuildContext context) {
  return twoItemsTextSpan(
    context,
    firstSection: SentenceRepositary.shared.dontHaveAcc,
    secondSection: SentenceRepositary.shared.registerRegister,
    onPressed: () {
      context.read<PageController>().previousPage(
            duration: const Duration(milliseconds: 850),
            curve: Curves.easeInOutExpo,
          );
    },
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
