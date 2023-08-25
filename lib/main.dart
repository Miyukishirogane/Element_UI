import 'package:flutter/material.dart';

void main() {
  runApp(my_app());
}

class my_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U/I Element',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ElementList(),
    );
  }
}

class ElementList extends StatelessWidget {
  final List<String> uiElements = [
    'Text',
    'Button',
    'Image',
    'TextField',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('U/I Element'),
      ),
      body: ListView.builder(
        itemCount: uiElements.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(uiElements[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElementFunction(elementName: uiElements[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ElementFunction extends StatelessWidget {
  final String elementName;

  const ElementFunction({required this.elementName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(elementName),
      ),
      body: Center(
        child: elementUI(elementName),
      ),
    );
  }

  Widget elementUI(String elementName) {
    switch (elementName) {
      case 'Text':
        return const Text('A Text is a widget in Flutter that allows us to display a string of text with a single line in our application');
      case 'Button':
        return TextButton(
          onPressed:(){} ,
          style:TextButton.styleFrom(foregroundColor: Colors.red, textStyle: const TextStyle(fontSize: 28,)),
          child: const Text('Button'),
        );
      case 'Image':
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: [Image.asset('assets/images/pikachu.png', width: 200,
            ),
            ]
        );
      case 'TextField':
        return TextFormField(
          decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter your name',
          ),
        );
      default:
        return const Text('Unidentify');
    }   
  }
}