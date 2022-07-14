import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training_demo/constants.dart';
import 'package:flutter_training_demo/controller/question_controler.dart';
import 'package:flutter_training_demo/screens/quiz/components/progress_bar.dart';
import 'package:flutter_training_demo/screens/quiz/components/questoin_card.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding)
                          .copyWith(top: kDefaultPadding),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                            text:
                                "Question ${questionController.questionNumber.value}"),
                        TextSpan(
                            text: "/${questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: kSecondaryColor)),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: questionController.updatePageNum,
                  controller: questionController.pageController,
                  itemCount: questionController.questions.length,
                  itemBuilder: ((context, index) => QuestionCard(
                        question: questionController.questions[index],
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
