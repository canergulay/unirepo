import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar.dart';

class SearchBarStackWidget extends StatelessWidget {
  const SearchBarStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        pickUniversityIllustration(context),
        const SearchBar(),
      ],
    );
  }

  Container pickUniversityIllustration(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.limitedheightUnit * 20,
        bottom: context.limitedheightUnit * 2,
        left: context.limitedwidthUnit * 3,
        right: context.limitedwidthUnit * 4,
      ),
      child: Column(
        children: [
          illustrationContainer(context),
          SizedBox(height: context.limitedheightUnit * 2),
          Text(SentenceRepositary.shared.pick, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }

  Image illustrationContainer(BuildContext context) {
    return Image.asset(
      AssetPaths.instance.university,
    );
  }
}
