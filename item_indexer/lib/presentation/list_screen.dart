import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:item_indexer/presentation/keys.dart';
import 'package:item_indexer/models/item.dart';

typedef OnSaveCallback = void Function(String task, String note);

class ListScreen extends StatefulWidget {
  final OnSaveCallback onSave;
  //final Item item;

  ListScreen(
    //Needs item still
    {Key key, @required this.onSave})
    : super(key: key ?? ItemIndexerKeys.itemList);
    

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
      itemCount: items.length*2,
      itemBuilder: (context, i){
        /*if (i.isOdd) return Divider();

        final index = i ~/2;
        return _buildRow(items[index]);*/
        if (i.isOdd) return Divider();
        return _buildRow(items[(i/2).round()]);
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