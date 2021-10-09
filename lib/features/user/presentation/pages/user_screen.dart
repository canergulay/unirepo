import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/manager/authentication_provider.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register_info_title.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/registration_form.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: SizedBox(
        height: context.dynamicHeight * 1,
        child: getAuthenticatedWidget(context),
      ),
    );
  }

  Widget getAuthenticatedWidget(BuildContext context) {
    return context.watch<AuthenticationProvider>().authenticationState.when(
      unauthenticated: () {
        return unAuthenticated(context);
      },
      authenticated: (User user) {
        return authenticated(context);
      },
      needsverification: (User user) {
        return needsVerification(context);
      },
    );
  }

  Widget authenticated(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('user logged in'),
      ],
    );
  }

  Widget unAuthenticated(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 20),
        Image.asset(AssetPaths.instance.login, scale: 3),
        registerInfoTitle(context),
        RegistrationForm(),
        const Spacer(flex: 12),
      ],
    );
  }

  Widget needsVerification(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('needs verification'),
      ],
    );
  }
}
