import "package:flutter/material.dart";
import 'package:flutter_training_demo/constants.dart';
import 'package:flutter_training_demo/controller/question_controler.dart';
import 'package:flutter_training_demo/models/question.dart';
import 'package:flutter_training_demo/screens/quiz/components/option.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  
  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: kBlackColor),
            ),
            ...List.generate(
              question.options.length,
              (index) => Option(
                text: question.options[index],
                index: index,
                pressCallBack: () => questionController.checkAns(question, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
