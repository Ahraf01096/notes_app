import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'note_item.dart';

class SearchNotes extends StatefulWidget {
  @override
  _SearchNotesState createState() => _SearchNotesState();
}

class _SearchNotesState extends State<SearchNotes> {
  String _searchText = '';

  Search(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context)
            .notes!
            .where((note) =>
                note.title.toLowerCase().contains(_searchText.toLowerCase()) ||
                note.subTitle.toLowerCase().contains(_searchText.toLowerCase()))
            .toList();
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            NoteModel note = notes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: NoteItem(note: note),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.black12,
                ),
                child: CustomTextField(
                  hint: "Search..",
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                )),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: Search(context),
            ),
          ],
        ),
      ),
    );
  }
}
