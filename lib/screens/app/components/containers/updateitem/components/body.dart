import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/fields/input_field.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _messageInputController;
  void initState() {
    _messageInputController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
       child: SingleChildScrollView(
         child: Column(
         children: <Widget>[
           RoundedInputField(
              hintText: "Title",
              onChanged: (value) {},
            ),
           SizedBox(height: 6),
           RoundedInputField(
              hintText: "Description",
              onChanged: (value) {},
            ),
            SizedBox(height: 6),
           RoundedInputField(
              hintText: "Price",
              onChanged: (value) {},
            ),
            SizedBox(height: 6),
           
            SizedBox(height: 6),
           RoundedInputField(
              hintText: "Discount Price",
              onChanged: (value) {},
            ),
            SizedBox(height: 6),
            Text("Gategories"), 
            TextField(
              controller: _messageInputController,
              decoration: InputDecoration(
                hintText: "Gategories",
                border: InputBorder.none,
              ),
            ),
            FilterChip(
              label: Text("Osama"), 
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide()),
              onSelected: (value) {
                String text = _messageInputController.text;
                TextSelection textSelection = _messageInputController.selection;
                String newText = text.replaceRange(
                    textSelection.start, textSelection.end, "Osama");
                final valueLength = "Osama".length;
                _messageInputController.text = newText;
                _messageInputController.selection = textSelection.copyWith(
                  baseOffset: textSelection.start + valueLength,
                  extentOffset: textSelection.start + valueLength,
                );
              },
          ),
          FilterChip(
              label: Text("text"), 
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide()),
              onSelected: (bool value) {print("selected");},
          ),
          FilterChip(
              label: Text("text"), 
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide()),
              onSelected: (bool value) {print("selected");},
          ),
          FilterChip(
              label: Text("text"), 
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide()),
              onSelected: (bool value) {print("selected");},
          ),

         ],
       ),
       ),
    );
  }
}