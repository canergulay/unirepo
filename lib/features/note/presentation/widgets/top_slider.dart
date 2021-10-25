import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/palette.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/core/utils/toast_manager.dart';
import 'package:unirepo/features/note/data/models/note/note.dart';
import 'package:unirepo/features/note/presentation/provider/note_page_provider.dart';

CarouselSlider notesTopSlider(BuildContext context, {required Note note}) {
  return CarouselSlider(
      options: CarouselOptions(
        scrollPhysics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        height: context.dynamicHeight * 0.30,
        enableInfiniteScroll: false,
        initialPage: context.read<NotesPageViewProvider>().sliderState,
        viewportFraction: 0.6,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayCurve: Curves.easeIn,
        onPageChanged: (index, reason) {
          context.read<NotesPageViewProvider>().updateSlider(index);
        },
        enlargeCenterPage: true,
      ),
      items: [
        for (var i = 0; i < note.documents!.length; i++) imageContainer(note.documents?[i], i == note.documents!.length - 1, context),
      ]);
}

AnimatorButton imageContainer(String? image, bool isLastOne, BuildContext context) {
  return AnimatorButton(
    upperBound: 0.3,
    onPressed: () {
      ToastManager.instance.showErrorToast(context, message: SentenceRepositary.shared.activateError);
    },
    childToBeAnimated: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(Palette.instance.borderRadiusPlus),
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                spreadRadius: 2,
                color: Colors.black.withAlpha(10),
              ),
            ]),
        child: imageOrLast(isLastOne, context, image)),
  );
}

Widget imageOrLast(bool isLastOne, BuildContext context, String? image) => !isLastOne
    ? Image.network(
        image ?? '',
        fit: BoxFit.cover,
      )
    : youNeedToPay(context);

Column youNeedToPay(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: context.limitedheightUnit * 3,
      ),
      Image.asset(
        AssetPaths.instance.lock,
        scale: 6,
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: context.limitedheightUnit),
        child: Text(
          SentenceRepositary.shared.cont,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.background,
              ),
        ),
        width: double.infinity,
      ),
      SizedBox(
        height: context.limitedheightUnit * 0.5,
      ),
      Text(
        SentenceRepositary.shared.contExp,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
      ),
    ],
  );
}

Consumer<NotesPageViewProvider> smoothIndicator() {
  return Consumer<NotesPageViewProvider>(
    builder: (context, provider, widget) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSmoothIndicator(
            activeIndex: provider.sliderState,
            count: 6,
            effect: WormEffect(
              activeDotColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SizedBox(
            width: context.limitedwidthUnit,
          ),
          Image.asset(AssetPaths.instance.lock, height: context.limitedheightUnit * 4)
        ],
      );
    },
  );
}
