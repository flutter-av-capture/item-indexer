import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:item_indexer/presentation/keys.dart';
import 'package:item_indexer/models/item.dart';

typedef OnSaveCallback = void Function(String task, String note);

class ListScreen extends StatefulWidget {
  //final OnSaveCallback onSave;
  final List<Item> items;

  ListScreen(
    {
      Key key, 
      //@required this.onSave,
      @required this.items})
    : super(key: key ?? ItemIndexerKeys.itemList);
    

  @override
  _ListScreenState createState() => _ListScreenState();
 
}

class _ListScreenState extends State<ListScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _biggerFont = const TextStyle(fontSize: 18.0);
  //final items = ["Test", "Items", "name", "filler"];
  List<Item> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _buildItems(),
        );
  }


  Widget _buildItems(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length*2,
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();
        return _buildRow(items[(i/2).round()].toString());
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