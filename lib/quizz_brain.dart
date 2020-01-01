import 'question.dart';

class QuizzBrain{
  int _currentQuestionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
//    Question('The Earth is the fourth planet from the sun.', false),
//    Question('The planet Venus has no moons.', true),
//    Question('Jupiter is composed mostly of iron.', false),
//    Question('The sun is a star of average size.', true),
//    Question('A lunar eclipse occurs when the sun passes.',  false)
  ];

  String getQuestionTextOfCurrentQuestionIndex() => _questionBank[_currentQuestionNumber].questionText;

  bool getQuestionAnswerOfCurrentQuestionIndex() => _questionBank[_currentQuestionNumber].questionAnswer;

  bool nextQuestion(){
      if(_currentQuestionNumber < _questionBank.length - 1) {
        _currentQuestionNumber++;
        return true;
      }
      return false;
  }

  bool checkIsRightAnswerToCurrentQuestion(bool providedAnswer) =>
      _questionBank[_currentQuestionNumber].questionAnswer == providedAnswer ? true : false;


  void initQuizz(){
    _currentQuestionNumber = 0;
  }
}