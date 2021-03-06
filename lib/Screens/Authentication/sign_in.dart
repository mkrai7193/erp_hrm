import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/Common/input_validator.dart';
import 'package:maan_hrm/Extra/ApiClass.dart';
import 'package:maan_hrm/Extra/Urls.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Authentication/forgot_password.dart';
import 'package:maan_hrm/Screens/Authentication/sign_up.dart';
import 'package:maan_hrm/Screens/Home/home_screen.dart';
import 'package:maan_hrm/constant.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nb_utils/nb_utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
            backgroundColor: kMainColor,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text('Sign In',
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: ModalProgressHUD(
                  inAsyncCall: _loading,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                                'Sign In now to begin an amazing journey',
                                style:
                                    kTextStyle.copyWith(color: Colors.white))),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0)),
                                    color: Colors.white),
                                child: Column(children: [
                                  const SizedBox(height: 20.0),
                                  AppTextField(
                                      textFieldType: TextFieldType.NAME,
                                      controller: phoneController,
                                      enabled: true,
                                      validator: (value) => InputValidator()
                                          .validatePhoneNumber(value, 'Username/Phone'),
                                      decoration: InputDecoration(
                                        labelText: 'Username/Phone Number',
                                        hintText: '1767 432556',
                                        labelStyle: kTextStyle,
                                        counterText: '',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: const OutlineInputBorder(),
                                        /*prefixIcon: CountryCodePicker(
                                              padding: EdgeInsets.zero,
                                              onChanged: print,
                                              initialSelection: 'IN',
                                              showFlag: true,
                                              showDropDownButton: true,
                                              alignLeft: false)*/
                                      )),
                                  const SizedBox(height: 20.0),
                                  AppTextField(
                                      textFieldType: TextFieldType.PASSWORD,
                                      controller: passwordController,
                                      validator: (value) => InputValidator()
                                          .validatePassword(value),
                                      maxLength: 12,
                                      decoration: InputDecoration(
                                          counterText: '',
                                          labelText: 'Password',
                                          labelStyle: kTextStyle,
                                          hintText: 'Enter password',
                                          border: const OutlineInputBorder())),
                                  const SizedBox(height: 20.0),
                                  Row(children: [
                                    Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                            value: isChecked,
                                            thumbColor: kGreyTextColor,
                                            onChanged: (bool value) {
                                              setState(() {
                                                isChecked = value;
                                              });
                                            })),
                                    Text('Save Me', style: kTextStyle),
                                    const Spacer(),
                                    Text('Forgot Password?', style: kTextStyle)
                                        .onTap(() {
                                      const ForgotPassword().launch(context);
                                    })
                                  ]),
                                  const SizedBox(height: 20.0),
                                  ButtonGlobal(
                                      buttontext: 'Sign In',
                                      buttonDecoration: kButtonDecoration
                                          .copyWith(color: kMainColor),
                                      onPressed: () {
                                        validateSignInForm();
                                      }),
                                  const SizedBox(height: 20.0),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Don\'t have an account? ',
                                        style: kTextStyle.copyWith(
                                            color: kGreyTextColor)),
                                    WidgetSpan(
                                        child: Text(
                                      'Sign Up',
                                      style: kTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: kMainColor),
                                    ).onTap(() {
                                      const SignUp().launch(context);
                                    }))
                                  ]))
                                ])))
                      ]),
                ))));
  }

  Future validateSignInForm() async {
    if (_formKey.currentState!.validate()) {
      login();
    } else {
      return;
    }
  }

  void login() {
    setState(() {
      _loading = true;
    });
    var body = {
      "Login_Id": phoneController.text,
      "PWD": passwordController.text,
    };
    debugPrint('bodyRegister => ${body.toString()}');
    Map<String, dynamic> apiData = {"url": Urls.login, 'data': body};
    ApiClass.postApiCall(apiData, (onSuccess) {
      debugPrint('ON_SUCCESS' + onSuccess.toString());

      setState(() {
        _loading = false;
      });

      var jsonRoot = jsonDecode(onSuccess['response']);
      if (jsonRoot != null && jsonRoot['success'] == 1) {
        const HomeScreen().launch(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonRoot["message"]), backgroundColor: Colors.red));
      }
    }, (onError) {
      debugPrint("ON Error  " + onError.toString());
      var jsonRoot = jsonDecode(onError['message']);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonRoot["errors"][0]["msg"].toString()),
          backgroundColor: Colors.red));
      setState(() {
        _loading = false;
      });
    });
  }
}
