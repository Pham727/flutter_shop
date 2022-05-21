class Todo{
  int? id;
  final String title;
  final String description;
  DateTime creationDate;
  bool isChecked;
  Todo({
    this.id,
    required this.title,
    this.description='',
    required this.creationDate,
    this.isChecked = false,
  });

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'creationDate':creationDate.toString(),
      'isChecked': isChecked,
    };
  }
  @override
  String toString(){
    return'ToDo(id: $id, title: $title,description:$description, creationDate:$creationDate, isChecked:$isChecked)';
  }
}