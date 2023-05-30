class QuestionsObjects {
  int? iId;
  String? question;
  String? answer1;
  String? score1;
  String? answer2;
  String? score2;
  String? answer3;
  String? score3;
  String? answer4;
  String? score4;

  QuestionsObjects(
      {this.iId,
        this.question,
        this.answer1,
        this.score1,
        this.answer2,
        this.score2,
        this.answer3,
        this.score3,
        this.answer4,
        this.score4});

  QuestionsObjects.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    question = json['question'];
    answer1 = json['answer1'];
    score1 = json['score1'];
    answer2 = json['answer2'];
    score2 = json['score2'];
    answer3 = json['answer3'];
    score3 = json['score3'];
    answer4 = json['answer4'];
    score4 = json['score4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['question'] = this.question;
    data['answer1'] = this.answer1;
    data['score1'] = this.score1;
    data['answer2'] = this.answer2;
    data['score2'] = this.score2;
    data['answer3'] = this.answer3;
    data['score3'] = this.score3;
    data['answer4'] = this.answer4;
    data['score4'] = this.score4;
    return data;
  }
}