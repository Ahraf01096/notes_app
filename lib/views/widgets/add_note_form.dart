
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title,subTitle;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value){
              title = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (value){
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else{
                autovalidateMode = AutovalidateMode.always;
                setState(() {

                });
              }
            } ,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

