import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldOtpKey = GlobalKey<ScaffoldState>();

class OTP extends StatelessWidget {
  static String? _otp;
  final _otpFormKey = GlobalKey<FormState>();
  static UserModel? _userModel;
  static ValidationHelper _validator = ValidationHelper.empty();

  _onOtpSaved(String? value) {
    _otp = value!.trim();
  }

  Widget _otpTF(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onSaved: _onOtpSaved,
      validator: _validator.otpValidator,
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
        _verifyBtnPressed(context);
      },
      decoration: InputDecoration(
        border: Constants.blackInputBorder,
        enabledBorder: Constants.blackInputBorder,
        focusedBorder: Constants.blackInputBorder,
        labelText: 'OTP',
        prefixIcon: const Icon(Icons.vpn_key),
      ),
    );
  }

  Widget _verifyBtn(BuildContext context) {
    return Container(
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
        onPressed: () {
          _verifyBtnPressed(context);
        },
      ),
    );
  }

  verifyHandler(BuildContext context, UserModel userModel) async {
    return await context.read<ApiProvider>().otpRegistration(userModel);
  }

  _verifyBtnPressed(BuildContext context) async {
    final FormState form = _otpFormKey.currentState!;
    if (form.validate()) {
      form.save();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userModelAsString = await prefs.getString('user');

      if (userModelAsString != null) {
        _userModel = UserModel.fromJson(jsonDecode(userModelAsString));
        _userModel!.otp = _otp;

        verifyHandler(context, _userModel!).then((value) {
          ServerResponse resp = serverResponseFromJson(value.body);
          if (value.statusCode == 201) {
            successToast('${resp.detail}');
            Navigator.of(context).pop();
          } else {
            Future.delayed(Duration(milliseconds: 200), () {
              dialogInfo(
                _scaffoldOtpKey.currentContext!,
                '${resp.detail}',
                'Warning',
              );
            });
          }
        }).catchError((error) {
          Future.delayed(Duration(milliseconds: 200), () {
            dialogInfo(
              _scaffoldOtpKey.currentContext!,
              '${error.toString()}',
              'Error',
            );
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldOtpKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(
          top: 0,
          left: 30,
          right: 30,
          bottom: 0,
        ),
        child: Form(
          key: _otpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter the One Time Password sent to your phone",
                style: Constants.boldSubheadlineStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _otpTF(context),
            ],
          ),
        ),
      ),
      floatingActionButton: _verifyBtn(context),
    );
  }
}
