import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
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
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthUnit * 3,
          vertical: context.heightUnit * 9,
        ),
        width: double.infinity,
        child: Column(
          children: [
            userAvatar(userData, context),
            SizedBox(height: context.limitedheightUnit * 2),
            Text(userData.name ?? '', style: Theme.of(context).textTheme.headline5),
            SizedBox(height: context.limitedheightUnit * 2),
            const Divider(color: Colors.black),
            creditBox(context, userData.credits ?? 0),
            const Divider(color: Colors.black),
          ],
        ),
      );
    }
    return const CircularProgressIndicator();
  }

  Padding creditBox(BuildContext context, int credit) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.widthUnit * 3,
        vertical: context.heightUnit * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AssetPaths.instance.coin,
                height: context.limitedheightUnit * 5,
              ),
              const SizedBox(
                width: 10,
              ),
              Text('Not görünteleme hakkı', style: Theme.of(context).textTheme.headline6),
            ],
          ),
          Text(credit.toString(), style: Theme.of(context).textTheme.headline6)
        ],
      ),
    );
  }

  Stack userAvatar(UserProfile userData, BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black26,
          backgroundImage: NetworkImage(
            userData.picture ?? '',
          ),
          radius: context.heightUnit * 9,
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: AnimatorButton(
              onPressed: () {},
              upperBound: 0.50,
              childToBeAnimated: Image.asset(
                AssetPaths.instance.gallery,
                height: context.limitedheightUnit * 5,
              ),
            )),
      ],
    );
  }
}
