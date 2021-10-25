import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/components/decorations/simple_shadow_decoration.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/features/home/data/models/course_prefix/course_prefix.dart';
import 'package:unirepo/features/home/presentation/mobx/search_mobx.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_provider.dart';

class CoursePrefixListView extends StatefulWidget {
  final List<CoursePrefix> coursePrefices;
  const CoursePrefixListView(
    this.coursePrefices, {
    Key? key,
  }) : super(key: key);

  @override
  State<CoursePrefixListView> createState() => _CoursePrefixListViewState();
}

class _CoursePrefixListViewState extends State<CoursePrefixListView> {
  int _selectedState = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.limitedwidthUnit * 5, vertical: context.limitedheightUnit * 3),
      child: widget.coursePrefices.length > 1
          ? ListView.builder(
              itemCount: widget.coursePrefices.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _builtItem(index);
              })
          : const SizedBox(),
    );
  }

  AnimatorButton _builtItem(
    int index,
  ) =>
      AnimatorButton(
        onPressed: () => changeButtonState(index),
        isOnPressedBeforeAnimation: true,
        upperBound: 0.45,
        childToBeAnimated: Container(
            decoration: boxDecorationGetter(index, _selectedState, context),
            padding: EdgeInsets.symmetric(vertical: context.limitedheightUnit, horizontal: context.limitedwidthUnit * 3),
            child: Text(widget.coursePrefices[index].prefix ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: textColorGetter(index, _selectedState), fontWeight: fontWeightGetter(index)))),
      );

  void changeButtonState(int index) {
    context.read<SearchBarProvider>().getNotesByPrefix(widget.coursePrefices[index].id ?? '');
    setState(() {
      _selectedState = index;
    });
  }
}

Color textColorGetter(int index, int state) {
  return index == state ? Colors.white : Colors.black45;
}

FontWeight fontWeightGetter(int index) {
  return index == 0 ? FontWeight.bold : FontWeight.normal;
}

BoxDecoration boxDecorationGetter(int myIndex, int _selectedState, BuildContext context) {
  if (myIndex == _selectedState) {
    return _selectedBoxDecoration(context);
  }

  return BoxDecoration(color: Theme.of(context).colorScheme.onSecondary);
}

BoxDecoration _selectedBoxDecoration(BuildContext context) {
  return BoxDecoration(color: Theme.of(context).colorScheme.secondaryVariant);
}
