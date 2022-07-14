import 'package:flutter/material.dart';
import 'package:flutter_training_demo/controller/question_controler.dart';
import 'package:flutter_training_demo/screens/quiz/components/body.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => questionController.nextQuestion(),
              // onPressed: () {},
              child: Text(
                "Skip",
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
      body: const Body(),
    );
  }
}
