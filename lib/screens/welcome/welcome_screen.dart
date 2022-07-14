import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training_demo/constants.dart';
import 'package:flutter_training_demo/screens/quiz/quiz_screen.dart';
import 'package:get/route_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  _showSankBar() {
    print(111);
    Get.snackbar("Getx is Awsome", "message");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset("assets/icons/bg.svg",
            width: double.infinity, fit: BoxFit.cover),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Let's Play Quiz",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text("Enter your info below"),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(top: kDefaultPadding),
                  child: const TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Full name",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(() => const QuizScreen(),
                        transition: Transition.downToUp);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Text(
                        "Lets start quiz",
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.black,
                            ),
                      )),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
