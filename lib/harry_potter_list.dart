import 'package:appharrypotter/harry_potter_card.dart';
import 'package:flutter/material.dart';
import 'harry_potter_model.dart';

class HarryPotterCharacterList extends StatelessWidget {
  final List<HarryPotterCharacter> characters;
  const HarryPotterCharacterList(this.characters, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: characters.length,
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (context, int) {
        return HarryPotterCharacterCard(characters[int]);
      },
    );
  }
}
