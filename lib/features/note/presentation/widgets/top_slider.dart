import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';
import 'package:unirepo/features/note/presentation/provider/note_page_provider.dart';

CarouselSlider notesTopSlider(BuildContext context, {required Note note}) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 300,
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
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.amber),
          child: Image.network(
            i ?? '',
            fit: BoxFit.fitHeight,
          ));
    }).toList(),
  );
}

Consumer<NotesPageViewProvider> smoothIndicator() {
  return Consumer<NotesPageViewProvider>(
    builder: (context, provider, widget) {
      return AnimatedSmoothIndicator(
        activeIndex: provider.sliderState,
        count: 6,
        effect: WormEffect(),
      );
    },
  );
}
