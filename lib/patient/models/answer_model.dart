class AnswerModel {
  String? question1;
  String? answer2;
  int? score2;
  String? question2;
  String? answer1;
  int? score1;
  String? question;

  AnswerModel(
      {this.question1,
        this.answer2,
        this.score2,
        this.question2,
        this.answer1,
        this.score1,
        this.question});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    question1 = json['Question1'];
    answer2 = json['answer2'];
    score2 = json['score2'];
    question2 = json['Question2'];
    answer1 = json['answer1'];
    score1 = json['score1'];
    question = json['Question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Question1'] = this.question1;
    data['answer2'] = this.answer2;
    data['score2'] = this.score2;
    data['Question2'] = this.question2;
    data['answer1'] = this.answer1;
    data['score1'] = this.score1;
    data['Question'] = this.question;
    return data;
  }
}