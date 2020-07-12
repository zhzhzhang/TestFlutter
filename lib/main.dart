import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StartName General"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    final _suggestions = <WordPair> [];
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i){
          if(i.isOdd) return Divider();
          final index = i ~/ 2;
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _BuildRow(_suggestions[index]);
        }
    );
  }

  Widget _BuildRow(WordPair wordpair){
    return ListTile(
      title: Text(
          wordpair.asPascalCase,
          style: _biggerFont,
      ),
    );
  }
}
