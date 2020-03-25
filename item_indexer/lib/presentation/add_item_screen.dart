import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:item_indexer/keys.dart';
import 'package:item_indexer/models/models.dart';

import 'package:item_indexer/presentation/keys.dart';


typedef OnSaveCallback = void Function(String id, String bin);

class AddItemScreen extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Item item;
  
  AddItemScreen(
      {Key key, @required this.onSave, @required this.isEditing, this.item})
      : super(key: key ?? ItemIndexerKeys.addItemScreen);
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
 
}

class _AddItemScreenState extends State<AddItemScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _id;
  String _bin;

  bool get isEditing => widget.isEditing;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override 
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final localizations = ArchSampleLocalizations.of(context);
    // final textTheme = Theme.of(context).textTheme;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
            TextFormField( 
              initialValue: isEditing ? widget.item.id : '',
              key: ItemIndexerKeys.idField,
              autofocus: !isEditing,
              controller: myController,
              decoration: InputDecoration( 
                labelText: 'Enter an item name'
                // hintText: localizations.newItemHint,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  // developer.log('no name', name: 'addItem.category');
                  return 'Please enter some text';
                }
                return null;
                // return val.trim().isEmpty
                //       ? localizations.emptyTodoError
                //       : null;
              },
              onSaved: (value) => _id = value,
            ),
            TextFormField(
              initialValue: isEditing ? widget.item.bin : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration( 
                labelText: 'Enter a bin number'
                // hintText: localizations.binHint,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  // developer.log('no bin', name: 'addItem.category');
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) => _bin = value,
            ),
            Padding( 
              padding: const EdgeInsets.symmetric(vertical: 16.0),
      //         floatingActionButton: FloatingActionButton(
      //         key:
      //             isEditing ? ArchSampleKeys.saveTodoFab : ArchSampleKeys.saveNewTodo,
      //         tooltip: isEditing ? localizations.saveChanges : localizations.addItem,
      //         child: Icon(isEditing ? Icons.check : Icons.add),
      //         onPressed: () {
      //           if (_formKey.currentState.validate()) {
      //             _formKey.currentState.save();
      //             widget.onSave(_task, _note);

      //             Navigator.pop(context);
      //           }
      //         },
      // ),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  // developer.log('form submitted', name: 'addItem.category');
                  Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),  
        ]
     )
    );
  }
}