import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register/register_info_title.dart';
import 'package:unirepo/features/user/presentation/widgets/unauthenticated/register/registration_form.dart';

import 'login/login_form.dart';

class UnAuthenticated extends StatefulWidget {
  const UnAuthenticated({Key? key}) : super(key: key);

  @override
  State<UnAuthenticated> createState() => _UnAuthenticatedState();
}

class _UnAuthenticatedState extends State<UnAuthenticated> {
  late final PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 3),
        Image.asset(AssetPaths.instance.login, scale: 3),
        registerInfoTitle(context),
        ListenableProvider<PageController>(
          // we will provide this pageview controller so that, sub widgets in the tree be able to switch the page.

          create: (context) => _controller,
          child: loginRegisterPageView(),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  Expanded loginRegisterPageView() {
    return Expanded(
      flex: 21,
      child: PageView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _controller,
        children: const [
          RegistrationForm(),
          LoginForm(),
        ],
      ),
    );
  }
}
