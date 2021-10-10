import 'package:flutter/material.dart';

class NeedsVerification extends StatelessWidget {
  const NeedsVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('needs verification'),
      ],
    );
  }
}
