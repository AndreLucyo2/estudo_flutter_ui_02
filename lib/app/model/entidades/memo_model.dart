class MemoModel {
  // o ? ajuste para o Dart 2.9 introduces Sound Null Safety
  // o ? permite inicializar variável como null
  // A principal mudança,é que todos os tipos agora são não anuláveis por padrão .
  final int? id;
  final String? title;
  final String? content;

  //Construtor:
  MemoModel({this.id, this.title, this.content});

  //Converter para map
  Map<String, dynamic> toMap() {
    //used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "title": title,
      "content": content,
    };
  }
}
