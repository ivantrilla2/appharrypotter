import 'package:flutter/material.dart';
import 'dart:async';
import 'harry_potter_model.dart';
import 'harry_potter_list.dart';
import 'new_harry_potter_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My fav Harry Potter Characters',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(
        title: 'My fav Harry Potter Characters',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<HarryPotterCharacter> initialHarryPotterCharacters = [HarryPotterCharacter('Harry Potter'), HarryPotterCharacter('Hermione Granger'), HarryPotterCharacter('Sirius Black')];

  Future _showNewHarryPotterCharacterForm() async {
    HarryPotterCharacter newHarryPotterCharacter = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return const AddHarryPotterCharacterFormPage();
    }));
    //print(newHarryPotterCharacter);
    initialHarryPotterCharacters.add(newHarryPotterCharacter);
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0), 
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: _showNewHarryPotterCharacterForm,
            ),
          )
        ],
      ),
      body: Container(
          color: const Color.fromARGB(255, 93, 255, 209),
          child: Center(
            child: HarryPotterCharacterList(initialHarryPotterCharacters),
          )),
    );
  }
}