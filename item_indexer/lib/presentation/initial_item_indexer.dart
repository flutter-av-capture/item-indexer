import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Inventory';
  final _items = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.indigo[900]
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MyCustomForm(),
    ItemList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Item'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text('Item List'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

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
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
            // Add TextFormFields and RaisedButton here.
            TextFormField( 
              // The validator receives the text that the user has entered.
              controller: myController,
              decoration: InputDecoration( 
                labelText: 'Enter an item name'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  developer.log('no name', name: 'addItem.category');
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField( 
              // The validator receives the text that the user has entered.
              keyboardType: TextInputType.number,
              decoration: InputDecoration( 
                labelText: 'Enter a bin number'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  developer.log('no bin', name: 'addItem.category');
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding( 
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  developer.log('form submitted', name: 'addItem.category');
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

// ATTEMPT TO REPURPOSE LIST FROM FLUTTER TUTORIAL:
class ItemListState extends State<ItemList> {
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

  class ItemList extends StatefulWidget{
    @override
    ItemListState createState() => ItemListState();
    
  }
/*
// DUMMY LIST FROM FLUTTER TUTORIAL:
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // #enddocregion RWS-var


  // #docregion _buildSuggestions
  Widget _itemList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _itemList(),
    );
  }
  // #enddocregion RWS-build
  // #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}*/