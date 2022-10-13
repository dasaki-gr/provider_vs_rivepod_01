import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//

void main() {
  runApp(mainWidget());
}

MultiProvider mainWidget() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Favorites()),
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'My favorite fruit is ${Provider.of<Favorites>(context).fruit}'),
        ),
        body: Center(
          child: Column(children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Provider case'),
            ),
            FruitButton('Apples'),
            FruitButton('Oranges'),
            FruitButton('Bananas'),
          ]),
        ),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;

  const FruitButton(this.fruit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).changeFruit(fruit);
          },
          child: Text(fruit)),
    );
  }
}

class Favorites extends ChangeNotifier {
  String fruit = 'unKnown';
  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
