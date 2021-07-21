class Sprint {
  final String name;
  final String id;
  final int number;
  final DateTime startDate;
  final DateTime finishDate;
  final int duration;

  Sprint(
      {this.name,
      this.id,
      this.number,
      this.startDate,
      this.finishDate,
      this.duration});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "duration": duration,
      "startDate": startDate,
      "finishDate": finishDate,
      "number": number
    };
  }

  static Sprint fromMap(String id, Map<String, dynamic> mapData) {
    return Sprint(
        id: id,
        name: mapData["name"],
        duration: mapData["duration"],
        startDate: mapData["startDate"],
        finishDate: mapData["finishDate"],
        number: mapData["number"]);
  }
}
