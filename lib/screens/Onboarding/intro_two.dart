import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class IntroTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer<OffsetNotifier>(
                builder: (context, value, child) {
                  double multiplier;

                  if (value.page! <= 1.0) {
                    multiplier = math.max(0, 4 * value.page! - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * value.page! - 4));
                  }

                  return Transform.scale(
                    scale: multiplier,
                    child: child,
                  );
                },
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, value, child) {
                  double multiplier;

                  if (value.page! <= 1.0) {
                    multiplier = math.max(0, 4 * value.page! - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * value.page! - 4));
                  }

                  return Transform.translate(
                    offset: Offset(0, -50 * (1 - multiplier)),
                    child: Opacity(opacity: multiplier, child: child),
                  );
                },
                child: Image.asset(intros[1].image!),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, value, child) {
            double multiplier;

            if (value.page! <= 1.0) {
              multiplier = math.max(0, 4 * value.page! - 3);
            } else {
              multiplier = math.max(0, 1 - (4 * value.page! - 4));
            }

            return Transform.translate(
              offset: Offset(0, -50 * (1 - multiplier)),
              child: child,
            );
          },
          child: Column(
            children: [
              Text(
                intros[1].title!,
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  intros[1].subtitile!,
                  style: GoogleFonts.quicksand(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
