import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'note_item.dart';

class SearchNotes extends StatefulWidget {
  const SearchNotes({super.key});

  @override
  SearchNotesState createState() => SearchNotesState();
}

class SearchNotesState extends State<SearchNotes> {
  String searchText = '';
  searchBar(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context)
            .notes!
            .where((note) =>
                note.title.toLowerCase().contains(searchText.toLowerCase()) ||
                note.subTitle.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            NoteModel note = notes[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
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
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Column(
          children: [
            CustomAppBar(
                title: "Search Notes",
                icon: CupertinoIcons.back,
                onPressed: () {
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 30,
            ),
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
                      searchText = value;
                    });
                  },
                )),
            Expanded(
              child: searchBar(context),
            ),
          ],
        ),
      ),
    );
  }
}
