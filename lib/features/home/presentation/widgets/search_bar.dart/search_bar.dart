import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/features/home/presentation/mobx/search_mobx.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 15,
              child: Consumer<SearchBarProvider>(builder: (context, _, __) {
                return Column(
                  children: [
                    Expanded(child: buildFloatingSearchBar(context)),
                  ],
                );
              })),
        ],
      );
    });
  }

  AnimatorButton optionButton(BuildContext context, {required SearchBarState myIndex, required double padding, required String text}) {
    return AnimatorButton(
      upperBound: 0.5,
      onPressed: () {},
      childToBeAnimated: Container(
        padding: EdgeInsets.all(padding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Provider.of<SearchBarProvider>(context).getColor(myIndex, context),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: Provider.of<SearchBarProvider>(context, listen: false).getTextStyle(myIndex, context),
        ),
      ),
      isOnPressedBeforeAnimation: true,
    );
  }
}

Widget buildFloatingSearchBar(BuildContext context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return Provider<SearchMobx>(
    create: (context) => SearchMobx(),
    child: Builder(builder: (context) {
      return FloatingSearchBar(
          margins: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          hint: Provider.of<SearchBarProvider>(context).getSearchHint(),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          leadingActions: [labelAnimatorText(context)],
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            Provider.of<SearchMobx>(context, listen: false).getTall();
            print(query);
            // Call your model, bloc, controller here.
          },
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(Icons.school),
                onPressed: () {},
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: Colors.accents.map((color) {
                    return Container(height: 112, color: color);
                  }).toList(),
                ),
              ),
            );
          });
    }),
  );
}

AnimatorButton labelAnimatorText(BuildContext context) {
  return AnimatorButton(
      onPressed: () {
        Provider.of<SearchBarProvider>(context, listen: false).changePage();
      },
      childToBeAnimated: Text(
        context.read<SearchBarProvider>().getLabelString(),
        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
      ));
}
