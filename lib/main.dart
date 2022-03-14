import 'package:flutter/material.dart';

import 'example_model.dart';

void main() {
  runApp(const MyApp());
}

/* Сегодня мы разберем с вами такую тему по работе с системными постоянными хранилищами данных они нужны для того чтобы записать туда какую либо информацию и если ваше прилодение закроется то данные сохранятся своего рода это база данных на минималках */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preferences'),
        ),
        body: const ExampleWidget(),
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = ExampleWidgetModelShared();
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // model.setName();
              },
              child: const Text('Сохранить имя'),
            ),
            ElevatedButton(
              onPressed: () {
                // model.readName();
              },
              child: const Text('Прочитать имя'),
            ),
            ElevatedButton(
              onPressed: () {
                // model.removeName();
              },
              child: const Text('Удалить имя'),
            ),
          ],
        ),
      ),
    );
  }
}

