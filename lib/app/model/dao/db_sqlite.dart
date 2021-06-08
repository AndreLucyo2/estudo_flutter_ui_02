import 'dart:io';

import 'package:estudo_flutter_ui_02/app/model/dao/db_query_create.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //para o join paths

//ref1: https://levelup.gitconnected.com/crud-with-flutter-and-sqlite-de3a68759531
//ref2: http://www.macoratti.net/19/08/flut_accsqlite1.htm

class DbSqlite {
  //
  static final _databaseName = "ExemploDB.db";
  static final _databaseVersion = 1;

  static final table = 'contato';

  static final columnId = '_id';
  static final columnNome = 'nome';
  static final columnIdade = 'idade';

  Future<Database> iniciar() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //retorna o diretorio onde ficam os doretorios permanentes
    final path =
        join(directory.path, "memos.db"); //definir o caminho e nome do Banco

    //Abre ou cria o arquivo do banco de dados:
    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1,
        onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela: Query vem da classe isolada
  Future _onCreate(Database db, int version) async {
    await db.execute(QueryCreateDB.queryDb);
  }
}
