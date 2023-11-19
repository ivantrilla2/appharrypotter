import 'package:appharrypotter/harry_potter_model.dart';
import 'package:flutter/material.dart';

class AddHarryPotterCharacterFormPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AddHarryPotterCharacterFormPage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _AddHarryPotterCharacterFormPageState createState() => _AddHarryPotterCharacterFormPageState();
}

class _AddHarryPotterCharacterFormPageState
    extends State<AddHarryPotterCharacterFormPage> {
  TextEditingController nameController = TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('You forgot to insert the Harry Potter character name'),
      ));
    } else {
      var newHarryPotterCharacter = HarryPotterCharacter(nameController.text);
      Navigator.of(context).pop(newHarryPotterCharacter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a New Harry Potter Character',
          style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: const Color.fromARGB(255, 93, 255, 209),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  onChanged: (v) => nameController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Harry Potter Character Name',
                    labelStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () => submitPup(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
                    ),
                    child: const Text('Submit Harry Potter Character'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
