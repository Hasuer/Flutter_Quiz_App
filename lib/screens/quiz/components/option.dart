import 'package:flutter/material.dart';
import 'package:flutter_training_demo/constants.dart';
import 'package:flutter_training_demo/controller/question_controler.dart';
import 'package:get/get.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.pressCallBack,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback pressCallBack;

  @override
  Widget build(BuildContext context) {
    // QuestionController questionController = Get.put(QuestionController());
    
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (questionController) {
        Color getColor() {
        if (questionController.isAnswered) {
          if (index == questionController.correctAns) {
            return kGreenColor;
          } else if (index == questionController.selectedAns &&
              questionController.selectedAns != questionController.correctAns) {
            return kRedColor;
          }
        }
        print("color");
        return kGrayColor;
      }
        return InkWell(
          onTap: pressCallBack,
          child: Container(
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getColor()),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1} $text",
                  style: TextStyle(color: getColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getColor() == kGrayColor ? null : getColor(),
                    border: Border.all(color: getColor()),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: getColor() == kGreenColor
                      ? const Icon(Icons.done)
                      : getColor() == kRedColor
                          ? const Icon(Icons.close)
                          : null,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
