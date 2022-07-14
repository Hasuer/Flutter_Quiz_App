import 'package:flutter/cupertino.dart';
import 'package:flutter_training_demo/models/question.dart';
import 'package:flutter_training_demo/screens/score/score_screen.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = sampleData
      .map(
        (e) => Question(
          id: e['id'],
          question: e["question"],
          answer: e["answer_index"],
          options: e["options"],
        ),
      )
      .toList();

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  List<Question> get questions => _questions;

  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(
        () {
          update();
        },
      );
    _pageController = PageController();
    _animationController.forward().whenComplete(nextQuestion);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedAns) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedAns;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }

    _animationController.stop();
    update(); // 记得update
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    print("nextQuestion11");
    if (_questionNumber != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
      update();
    } else {
      Get.to(const ScoreScreen());
    }
  }

  void updatePageNum(int index) {
    _questionNumber.value = index + 1;
  }

}
