import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SimbaDash extends StatelessWidget {
  const SimbaDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Eric,',
            style: Constants.kHeadlineStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your Credit Score went up by 20 points,',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'Good job',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 27),
            child: AspectRatio(
              aspectRatio: 1,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0, end: 0.8),
                duration: Constants.fluidDuration,
                builder: (context, value, child) =>
                    Stack(fit: StackFit.expand, children: [
                  CircularProgressIndicator(
                    value: 0.8,
                    color: Palette.ksmartPrimary,
                    strokeWidth: 7,
                    backgroundColor: Colors.grey,
                  ),
                  Positioned(
                    top: 90,
                    left: 30,
                    child: Column(
                      children: [
                        Text('720',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          'Good Job',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Palette.ksmartPrimary,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Last Updated: 27th June 2021',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
