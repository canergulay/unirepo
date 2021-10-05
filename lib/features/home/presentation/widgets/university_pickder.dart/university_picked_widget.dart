import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/decorations/simple_shadow_decoration.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_provider.dart';

class UniversityPicked extends StatelessWidget {
  const UniversityPicked({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchBarProvider provider = context.read<SearchBarProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [pickedUniversityContainer(context, provider)],
    );
  }

  Container pickedUniversityContainer(BuildContext context, SearchBarProvider provider) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: context.limitedheightUnit * 6, horizontal: context.limitedwidthUnit * 3),
        decoration: simpleShadowDecoration(context), // nothing but a smooth box decoration that contains a single box shadow and border radius.
        padding: EdgeInsets.symmetric(
          vertical: context.limitedheightUnit * 2,
          horizontal: context.limitedwidthUnit * 5,
        ),
        child: universityText(provider, context));
  }

  AutoSizeText universityText(SearchBarProvider provider, BuildContext context) {
    return AutoSizeText(
      provider.universityPicked.name ?? '',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}