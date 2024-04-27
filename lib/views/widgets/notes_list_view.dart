
import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
 final data = const [
   Color(0xffFFCC80),
   Color(0xff76D6EE),
   Color(0xffcc80ff),
   Color(0xffE7E896),
   Color(0xff768eee),
   Color(0xffd57d7d),
   Color(0xffdbff80),
   Color(0xffff80f9),
   Color(0xff80fbff),
   Color(0xffE7E896),
   Color(0xff768eee),
   Color(0xffd57d7d),
   Color(0xffdbff80),
   Color(0xffff80f9),
   Color(0xffFFCC80),
   Color(0xff76D6EE),
   Color(0xff768eee),
   Color(0xffd57d7d),
   Color(0xffdbff80),
   Color(0xffff80f9),
   Color(0xff80fbff),
   Color(0xffE7E896),

 ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) =>
            Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child:  NoteItem(color: data[index]),
        ),
        itemCount: 40,

      ),
    );
  }
}
