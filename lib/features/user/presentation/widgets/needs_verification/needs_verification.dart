import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';

class NeedsVerification extends StatelessWidget {
  const NeedsVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.limitedwidthUnit * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetPaths.instance.verify, scale: 2),
          SizedBox(height: context.limitedheightUnit * 5),
          RichText(
            text: TextSpan(
                text: 'Email adresin olan ',
                children: [
                  TextSpan(
                      text: FirebaseAuth.instance.currentUser?.email ?? '',
                      children: [
                        TextSpan(
                            text: ' adresine bir adet doğrulama kodu gönderdik. Devam edebilmek için hesabını doğrulamalısın.',
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold))
                ],
                style: Theme.of(context).textTheme.bodyText1),
          )
        ],
      ),
    );
  }
}
