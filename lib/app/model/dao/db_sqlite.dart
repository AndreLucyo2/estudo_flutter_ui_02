import 'dart:io';

import 'package:estudo_flutter_ui_02/app/model/entidades/memo_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //para o join paths

//ref1: https://levelup.gitconnected.com/crud-with-flutter-and-sqlite-de3a68759531
class DbSqlite {
  //Metodo que inicializa ou abre o banco de dados:
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "memos.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Memos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT)""");
    });
  }

  Future<int> addItem(MemoModel item) async {
    //returns number of items inserted as an integer
    final db = await init(); //open database
    return db.insert(
      "Memos", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<MemoModel>> fetchMemos() async {
    //returns the memos as a list (array)
    final db = await init();
    final maps =
        await db.query("Memos"); //Retorna todas as linhas de uma tabela

    return List.generate(maps.length, (i) {
      //create a list of memos
      return MemoModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  Future<int> deleteMemo(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("Memos", //table name
        where: "id = ?",
        whereArgs: [id] // Pega o id REcebido por SQL injection
        );

    return result;
  }

  Future<int> updateMemo(int id, MemoModel item) async {
    // returns the number of rows updated
    final db = await init();

    int result = await db
        .update("Memos", item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
