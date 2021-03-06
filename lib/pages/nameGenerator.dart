import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NameGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushSaved,
        tooltip: "저장된 이름 보기",
        child: Icon(Icons.save),
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      if (_saved.isEmpty) {
        return new Scaffold(
            appBar: new AppBar(
              title: const Text('저장된 이름들'),
            ),
            body: new Center(
              child: new Text(
                '저장된 이름이 없습니다',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ));
      } else {
        final Iterable<ListTile> tiles = _saved.map(
          (WordPair pair) {
            return new ListTile(
              title: new Text(pair.asPascalCase, style: _biggerFont),
            );
          },
        );
        final List<Widget> divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: const Text('저장된 추천 이름들'),
          ),
          body: new ListView(children: divided),
        );
      }
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          // infinite scrolling ListView
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
