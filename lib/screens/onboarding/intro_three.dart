import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class IntroThree extends StatelessWidget {
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
                  return Transform.scale(
                    scale: math.max(0, 1 - (1 - (4 * value.page! - 7))),
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
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.translationValues(
                        0, 100 * (1 - (4 * value.page! - 7)), 0)
                      ..rotateZ((-math.pi / 2) * 2 * value.page!),
                    child: child,
                  );
                },
                child: Image.asset(intros[2].image!),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, -50 * (1 - (4 * value.page! - 7))),
              child: child,
            );
          },
          child: Text(
            intros[2].title!,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, value, child) {
            return Opacity(
              opacity: math.max(0, 4 * value.page! - 7),
              child: child,
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              intros[2].subtitile!,
              style: GoogleFonts.quicksand(
                  fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
