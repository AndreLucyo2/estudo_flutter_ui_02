class QueryCreateDB {
  static String queryDb = """
    CREATE TABLE TB_Contato (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INTEGER NOT NULL
    )""";
}
