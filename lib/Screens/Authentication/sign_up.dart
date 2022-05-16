import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Authentication/sign_in.dart';
import 'package:maan_hrm/Screens/Home/home_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Common/input_validator.dart';
import '../../Extra/ApiClass.dart';
import '../../Extra/Urls.dart';
import '../../constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String employee = '0 - 10';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController employeeCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  DropdownButton<String> getEmployee() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String emp in employees) {
      var item = DropdownMenuItem(child: Text(emp), value: emp);
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: employee,
      onChanged: (value) {
        setState(() {
          employee = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Sign Up now to begin an amazing journey',
                            style: kTextStyle.copyWith(color: Colors.white))),
                    Container(
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
                              controller: employeeCodeController,
                              enabled: true,
                              validator: (value) => InputValidator()
                                  .validatePhoneNumber(value, 'Employee code'),
                              decoration: const InputDecoration(
                                  labelText: 'Employee Code',
                                  hintText: 'Employee Code',
                                  border: OutlineInputBorder())),
                          const SizedBox(height: 20.0),
                          AppTextField(
                              textFieldType: TextFieldType.NAME,
                              controller: nameController,
                              enabled: true,
                              validator: (value) => InputValidator()
                                  .validatePhoneNumber(value, 'Name'),
                              decoration: const InputDecoration(
                                  labelText: 'Name',
                                  hintText: 'Name',
                                  border: OutlineInputBorder())),
                          const SizedBox(height: 20.0),
                          AppTextField(
                              textFieldType: TextFieldType.EMAIL,
                              controller: emailController,
                              enabled: true,
                              validator: (value) => InputValidator()
                                  .validatePhoneNumber(value, 'Email'),
                              decoration: const InputDecoration(
                                  labelText: 'Email Address',
                                  hintText: 'Email Address',
                                  border: OutlineInputBorder())),
                          const SizedBox(height: 20.0),
                          AppTextField(
                              textFieldType: TextFieldType.PHONE,
                              controller: phoneController,
                              enabled: true,
                              validator: (value) => InputValidator()
                                  .validatePhoneNumber(value, 'Phone Number'),
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  hintText: '1767 432556',
                                  labelStyle: kTextStyle,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: CountryCodePicker(
                                      padding: EdgeInsets.zero,
                                      onChanged: print,
                                      initialSelection: 'IN',
                                      showFlag: true,
                                      showDropDownButton: true,
                                      alignLeft: false))),
                          const SizedBox(height: 20.0),
                          AppTextField(
                              textFieldType: TextFieldType.PASSWORD,
                              controller: passwordController,
                              enabled: true,
                              validator: (value) => InputValidator()
                                  .validatePhoneNumber(value, 'Password'),
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: kTextStyle,
                                  hintText: 'Enter password',
                                  border: const OutlineInputBorder())),
                          const SizedBox(height: 20.0),
                          /*SizedBox(
                          height: 60.0,
                          child: FormField(
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Select Gender',
                                    labelStyle: kTextStyle,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0))),
                                child:
                                    DropdownButtonHideUnderline(child: getEmployee()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),*/
                          ButtonGlobal(
                              buttontext: 'Sign Up',
                              buttonDecoration:
                                  kButtonDecoration.copyWith(color: kMainColor),
                              onPressed: () {
                                validateSignInForm();
                              }),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Have an account? ',
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                )),
                            WidgetSpan(
                                child: Text(
                              'Sign In',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kMainColor),
                            ).onTap(() {
                              const SignIn().launch(context);
                            }))
                          ])),
                          const SizedBox(height: 20.0),
                          /*Text('Or Sign Up With...',
                            style: kTextStyle.copyWith(
                                color: kGreyTextColor, fontSize: 12.0)),
                        Hero(
                          tag: 'social',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  elevation: 2.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: Center(
                                        child: Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Color(0xFF3B5998),
                                    )),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 2.0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Center(
                                    child: Image.asset(
                                      'images/google.png',
                                      height: 25.0,
                                      width: 25.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  elevation: 2.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.twitter,
                                        color: Color(0xFF3FBCFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )*/
                        ]))
                  ])),
            ),
          ),
        ));
  }

  Future validateSignInForm() async {
    if (_formKey.currentState!.validate()) {
      signUp();
    } else {
      return;
    }
  }

  void signUp() {
    setState(() {
      _loading = true;
    });
    var body = {
      "EmpCode": employeeCodeController.text,
      "email": emailController.text,
      "mobile": phoneController.text,
      "password": passwordController.text,
      "name": nameController.text,
      "Flag": "Y"
    };
    debugPrint('bodyRegister => ${body.toString()}');
    Map<String, dynamic> apiData = {"url": Urls.register, 'data': body};
    ApiClass.postApiCall(apiData, (onSuccess) {
      debugPrint('ON_SUCCESS' + onSuccess.toString());

      setState(() {
        _loading = false;
      });

      var jsonRoot = jsonDecode(onSuccess['response']);
      if (jsonRoot != null && jsonRoot['success'] == 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonRoot["message"]), backgroundColor: Colors.green));
        const SignIn().launch(context);
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
