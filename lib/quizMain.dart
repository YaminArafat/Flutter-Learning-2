import 'questions.dart';

class QuizMain {
  int _quesNo = 0;
  List<Questions> _questions = [
    Questions(
        questionText: 'Dhaka is the capital of Bangladesh', quesAns: true),
    Questions(
        questionText: 'Khulna is the capital of Bangladesh', quesAns: false),
    Questions(questionText: 'Friday comes after Thursday', quesAns: true),
    Questions(questionText: 'Saturday comes after Sunday', quesAns: false),
  ];
  void addQues({required String q, required String a}) {
    _questions
        .add(Questions(questionText: q, quesAns: a == 'true' ? true : false));
  }

  bool isFinished() {
    return _quesNo == _questions.length - 1;
  }

  void setQuesNo() {
    _quesNo = 0;
  }

  void nextQues() {
    if (_quesNo < _questions.length - 1) {
      _quesNo++;
    }
  }

  String getQues() {
    return _questions[_quesNo].questionText;
  }

  bool getAns() {
    return _questions[_quesNo].quesAns;
  }
}
