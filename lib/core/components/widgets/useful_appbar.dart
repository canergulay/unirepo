import 'package:flutter/material.dart';
import 'package:unirepo/features/home/presentation/widgets/university_pickder.dart/note_widget.dart';

AppBar usefulAppbar(BuildContext context, {required String text}) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primaryVariant,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    title: Text(
      text,
      style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
