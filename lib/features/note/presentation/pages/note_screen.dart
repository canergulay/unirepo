import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/widgets/useful_appbar.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';
import 'package:unirepo/features/note/presentation/provider/note_page_provider.dart';
import 'package:unirepo/features/note/presentation/widgets/top_slider.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  const NoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late final PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: usefulAppbar(
        context,
        text: '${widget.note.coursePrefix?.prefix} ${widget.note.courseCode} Ders Notu',
      ),
      body: Column(
        children: [
          SizedBox(height: context.limitedheightUnit * 5),
          notesTopSlider(context, note: widget.note),
          SizedBox(height: context.limitedheightUnit * 4),
          smoothIndicator(),
        ],
      ),
    );
  }
}
