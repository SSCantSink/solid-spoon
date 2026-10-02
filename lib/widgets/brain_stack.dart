import 'package:flutter/material.dart';

class BrainStack extends StatefulWidget {
  const BrainStack({super.key});

  @override
  State<BrainStack> createState() => _BrainStackState();
}

class _BrainStackState extends State<BrainStack> {

  // This is the stack in lists.
  List<String> stack = [];

  // The text field.
  String stackText = '';

  // This is used to programatically change the input of the text field.
  TextEditingController textEditingController = TextEditingController();

  // Widget methods
  @override
  void initState() {
    super.initState();
    // call above function
    textEditingController.clear(); 
  }

  @override
  Widget build(BuildContext context) {

    // Self-explanatory
    final String labelStackText = 'Pick one quickly!';

    ///
    /// Called in 1 widget below ONLY.
    ///
    void onPressedButton () {
        // Add to the stack in a setState
        setState(() {
          stack.add(stackText);
        }
      );
    }
    
    ///
    /// Called in 1 widget below ONLY.
    /// `deleteIndex` tells which index that needs to have its `listToRemoveAnElement[deleteIndex]` removed.
    ///
    void onPressedOneDeleteButton(int deleteIndex, List<String> listToRemoveAnElement, ) {
        setState(() {
          listToRemoveAnElement[deleteIndex] = "";
        });
    }

    // Self-explanatory
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            setState(() {
              stackText = text;
            });
          },
          controller: textEditingController,
          maxLength: 50,
          maxLines: 1,
          decoration: InputDecoration(
            labelText: labelStackText,
          ),
        ),
        const SizedBox.shrink(),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: ListView.builder(
            itemCount: stack.length,
            itemBuilder: (context, index) {
              return Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Column( // Painting problem? Row <==> Column got mixed up somehow...
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10.0,
                  children: [
                    ListTile(
                      title: Text((index + 1).toString()),
                      subtitle: Text(stack[index].toString()),
                    ),
                    TextButton(onPressed: () => {
                      // Anonymous functions for some reason requires NO semicolons...
                      onPressedOneDeleteButton(index, stack)
                    }, child: Text("DELETE"))
                  ],
                )
              );
            },
          ),
        ),
        const SizedBox(width: 100),
        TextButton(
          onPressed: onPressedButton, 
          child: Text("*SUBMIT*")
        )
      ],
    );
  }
}