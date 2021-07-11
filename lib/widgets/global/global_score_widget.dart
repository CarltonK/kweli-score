import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class GlobalScoreWidget extends StatefulWidget {
  final double scorePercentage;
  const GlobalScoreWidget({Key? key, required this.scorePercentage})
      : super(key: key);

  @override
  _GlobalScoreWidgetState createState() => _GlobalScoreWidgetState();
}

class _GlobalScoreWidgetState extends State<GlobalScoreWidget> {
  double? _tweenValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(27),
        vertical: getProportionateScreenHeight(10),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: widget.scorePercentage),
          duration: Constants.fluidDuration,
          curve: Constants.verySmoothCurve,
          builder: (context, double value, child) => child!,
          onEnd: () => setState(() => _tweenValue = widget.scorePercentage),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: _tweenValue,
                color: Palette.ksmartPrimary,
                strokeWidth: 8,
                backgroundColor: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '720',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Good Job',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    'Last Updated: 27th June 2021',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
