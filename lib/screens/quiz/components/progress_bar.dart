import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training_demo/constants.dart';
import 'package:flutter_training_demo/controller/question_controler.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff3f4768), width: 3),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("${(controller.animation.value*60).round()} sec"),
                        SvgPicture.asset("assets/icons/clock.svg")
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
