import 'package:flutter/material.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register/register_info_title.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register/registration_form.dart';

class UnAuthenticated extends StatelessWidget {
  const UnAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 20),
        Image.asset(AssetPaths.instance.login, scale: 3),
        registerInfoTitle(context),
        const RegistrationForm(),
        const Spacer(flex: 12),
      ],
    );
  }
}
