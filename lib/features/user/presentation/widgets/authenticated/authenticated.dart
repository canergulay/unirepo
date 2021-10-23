import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';
import 'package:unirepo/features/user/domain/usecases/get_user_info.dart';
import 'package:unirepo/features/user/presentation/provider/user_provider.dart';

class Authenticated extends StatefulWidget {
  const Authenticated({Key? key}) : super(key: key);

  @override
  State<Authenticated> createState() => _AuthenticatedState();
}

class _AuthenticatedState extends State<Authenticated> {
  @override
  void initState() {
    context.read<UserProfileProvider>().activateUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UserProfileProvider>(
          builder: (context, provider, _) {
            return userProfileBody(context);
          },
        ),
      ),
    );
  }

  Widget userProfileBody(BuildContext context) {
    bool hasUserProfileData = context.read<UserProfileProvider>().hasProfileData;
    if (hasUserProfileData) {
      UserProfile userData = context.read<UserProfileProvider>().userData;
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthUnit * 3,
              vertical: context.heightUnit * 9,
            ),
            width: double.infinity,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userData.picture ?? ''),
              radius: context.heightUnit * 9,
            ),
          ),
        ],
      );
    }
    return const CircularProgressIndicator();
  }
}
