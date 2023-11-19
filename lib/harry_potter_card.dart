import 'package:appharrypotter/harry_potter_model.dart';
import 'harry_potter_detail_page.dart';
import 'package:flutter/material.dart';


class HarryPotterCharacterCard extends StatefulWidget {
  final HarryPotterCharacter character;

  const HarryPotterCharacterCard(this.character, {super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _HarryPotterCharacterCardState createState() => _HarryPotterCharacterCardState(character);
}

class _HarryPotterCharacterCardState extends State<HarryPotterCharacterCard> {
  HarryPotterCharacter character;
  String? renderUrl;

  _HarryPotterCharacterCardState(this.character);

  @override
  void initState() {
    super.initState();
    renderHarryPotterCharacterPic();
  }

  Widget get harryPotterCharacterImage {
    var harryPotterCharacterAvatar = Hero(
      tag: character,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.black54, Colors.black, Color.fromARGB(255, 84, 110, 122)])),
      alignment: Alignment.center,
      child: const Text(
        'IMAGE',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: harryPotterCharacterAvatar,
      // ignore: unnecessary_null_comparison
      crossFadeState: renderUrl == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderHarryPotterCharacterPic() async {
    await character.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = character.imageUrl;
      });
    }
  }

  Widget get harryPotterCharacterCard {
    return Positioned(
      right: 0.0,
      child: SizedBox(
        width: 330,
        height: 115,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: const Color(0xFFF8F8F8),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.character.name,
                  style: const TextStyle(color: Color(0xFF000600), fontSize: 27.0),
                ),
                Text(
                  widget.character.actorRealName ?? "Unknown",
                  style: const TextStyle(color: Color.fromARGB(255, 4, 25, 255), fontSize: 15.0),
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.star, color: Color(0xFF000600)),
                    Text(': ${widget.character.rating}/10', style: const TextStyle(color: Color(0xFF000600), fontSize: 14.0))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showHarryPotterCharacterDetailPage() async {
    var updatedCharacter = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HarryPotterCharacterDetailPage(character, character.rating.toDouble());
    }));

    if (updatedCharacter != null) {
      setState(() {
        character = updatedCharacter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showHarryPotterCharacterDetailPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              harryPotterCharacterCard,
              Positioned(top: 7.5, child: harryPotterCharacterImage),
            ],
          ),
        ),
      ),
    );
  }
}
