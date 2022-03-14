import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExampleWidgetModelShared extends ChangeNotifier {
  // Вот так мы получаем _storage можно получать его отдельно в каждом методе или создать отдельную переменную но есть один нюанс это Future но getInstance - он запрашивается с нашей платформы и это довольно медленная операция и запрашивается с асинхроностью
  final _storage = SharedPreferences.getInstance();

  Future<void> readName() async {
    /* Давайте сначала попробуем прочитать имя */

    // Важно помнить что это ассинхронные операции и запоминать название ключей
    final storage = await _storage;
    final name = storage.getString(_SharedPreferencesKeys.name);
    print(name);
  }

  Future<void> setName() async {
    final storage = await _storage;
    const name = '';
    await storage.setString(_SharedPreferencesKeys.name, name);
  }

  Future<void> removeName() async {
    final storage = await _storage;
    await storage.remove(_SharedPreferencesKeys.name);
  }
}

/* Для хранения ключей мы можем создать отдельный приватный класс и сохранить туда все наши ключи что-бы не ошибаться в названии ключей */

abstract class _SharedPreferencesKeys {
  static const name = 'name_key';
}

// Hive это сторонняя библиотека которая позволяет хранить данные читать,записывать и т.д чем-то похожа на SharedPreferences но она самостоятельная и никакого отношения к платформе не имеет более того она позволяет хранить целые объекты

/* Для работы с Hive нам надо установить две библиотеки Hive и hive_flutter */

class ExampleWidgetModelHive {
  ExampleWidgetModelHive() {
    // Прежде чем начать работу с hive нам нужно ее инициализировать
    Hive.initFlutter();
  }
  void doSome() {}
}
