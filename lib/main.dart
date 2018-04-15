import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Wordis',
      home: new RandomWords() ,
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  var _suggestions = <WordPair>[];
  var _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('StartUp name generator'),
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
        padding: new EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    return new ListTile(
        title: new Text(wordPair.asPascalCase, style: _biggerFont));
  }
}
