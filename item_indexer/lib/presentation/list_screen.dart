import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:item_indexer/presentation/keys.dart';

typedef OnSaveCallback = void Function(String task, String note);

class ListScreen extends StatefulWidget {
  // final OnSaveCallback onSave;
  // final Item item;           item in models.dart
  
  // ListScreen(
  //     {Key key, @required this.onSave, @required this.item})
  //     : super(key: key ?? ItemIndexerKeys.ListScreen);
  // @override
  // _ListScreenState createState() => _ListScreenState();

  @override
  _ListScreenState createState() => _ListScreenState();
 
}

class _ListScreenState extends State<ListScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final items = ["Test", "Items", "name", "filler"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _buildItems(),
        );
  }


  Widget _buildItems(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();

        final index = i ~/2;
        if (index >= items.length){}
        return _buildRow(items[index]);
      }
    );
  }
    
  Widget _buildRow(String item){
    return ListTile(
      title: Text(
        item,
        style: _biggerFont)
      );
    }
  }