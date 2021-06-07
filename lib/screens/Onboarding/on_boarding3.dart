import 'package:flutter/material.dart';

class OnBoard3 extends StatelessWidget {
  const OnBoard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 130),
        color: Color(0xff2f9b7c),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/growth.png',
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Plan your spending',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Get advice on how to better your credit score hence putting you in lender's good books",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
                elevation: 5,
                height: 55,
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Get started',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
