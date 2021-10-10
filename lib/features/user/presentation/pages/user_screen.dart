import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/manager/authentication_provider.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/main_textfield.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/user/presentation/widgets/authenticated/authenticated.dart';
import 'package:unirepo/features/user/presentation/widgets/needs_verification/needs_verification.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register/register_info_title.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register/registration_form.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/unauthtenticated.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.height,
        child: getAuthenticatedWidget(context),
      ),
    );
  }

  Widget getAuthenticatedWidget(BuildContext context) {
    // A PERFECT IMPLEMENTATION OF A SEALED UNION INTO FLUTTER VIEW.
    // IT IS KIND OF BLoCBuilder, that we manually utilised, with the help of Freezed & SeaLeD UnIoNs
    return context.watch<AuthenticationProvider>().authenticationState.when(
      unauthenticated: () {
        return const UnAuthenticated();
      },
      authenticated: (User user) {
        return const Authenticated();
      },
      needsverification: (User user) {
        return const NeedsVerification();
      },
    );
  }
}
