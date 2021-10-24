import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/palette.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';
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
    items: note.documents?.map((i) {
      return imageContainer(i);
    }).toList(),
  );
}

Container imageContainer(String? image) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image ?? '',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(Palette.instance.borderRadiusPlus),
        boxShadow: [BoxShadow(blurRadius: 7, spreadRadius: 2, color: Colors.black.withAlpha(10))]),
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
