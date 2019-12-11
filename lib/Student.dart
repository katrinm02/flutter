class Student{
  String id;
  String name;
  int scores;

  Student({this.id, this.name, this.scores});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      scores: json['score'],
    );
  }
}