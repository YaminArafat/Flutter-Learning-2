import 'questions.dart';

class QuizMain {
  int _quesNo = 0;
  List<Questions> _questions = [
    Questions(q: 'Dhaka is the capital of Bangladesh', a: true),
    Questions(q: 'Khulna is the capital of Bangladesh', a: false),
    Questions(q: 'Friday comes after Thursday', a: true),
    Questions(q: 'Saturday comes after Sunday', a: false),
  ];
  void addQues({required String q, required String a}) {
    _questions.add(Questions(q: q, a: a == 'true' ? true : false));
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
