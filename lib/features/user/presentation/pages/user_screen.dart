import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/presentation/widgets/register_info_title.dart';
import 'package:unirepo/features/user/presentation/widgets/registration_form.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Image.asset(
            AssetPaths.instance.login,
            scale: 3,
          ),
          registerInfoTitle(context),
          const RegistrationForm(),
          const Spacer(flex: 12),
        ],
      ),
    );
  }
}
