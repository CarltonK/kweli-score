import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class OTP extends StatelessWidget {
  static String? _otp;
  final VoidCallback onPressed;

  OTP({Key? key, required this.onPressed}) : super(key: key);

  _onOtpSaved(String? value) {
    _otp = value!.trim();
  }

  Widget _otpTF() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onSaved: _onOtpSaved,
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'OTP',
        prefixIcon: const Icon(Icons.vpn_key),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(
          top: 150,
          left: 30,
          right: 30,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Enter the One Time Password sent to your phone",
              style: Constants.boldSubheadlineStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _otpTF(),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: onPressed,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
