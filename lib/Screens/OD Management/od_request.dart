import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';

class ODRequest extends StatefulWidget {
  const ODRequest({Key? key}) : super(key: key);

  @override
  _ODRequestState createState() => _ODRequestState();
}

class _ODRequestState extends State<ODRequest> {
  bool isNewRequest = false;
  String modeOfConvenience = 'Private transport';

  DropdownButton<String> getModeOfConvenience() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String modeOfConvenience in modeOfConvenienceList) {
      var item = DropdownMenuItem(
          child: Text(modeOfConvenience), value: modeOfConvenience);
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: modeOfConvenience,
      onChanged: (value) {
        setState(() {
          modeOfConvenience = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
            backgroundColor: kMainColor,
            elevation: 0.0,
            titleSpacing: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text('Self Travel - Local',
                maxLines: 2,
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            actions: const [
              Image(image: AssetImage('images/employeesearch.png'))
            ]),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20.0),
          Container(
              width: context.width(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: kBgColor),
              child: Column(children: [
                const SizedBox(height: 20.0),
                Row(children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isNewRequest = !isNewRequest;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: !isNewRequest
                                      ? kMainColor
                                      : kMainColor.withOpacity(0.1)),
                              child: Center(
                                  child: Text('Existing Request(s)',
                                      style: kTextStyle.copyWith(
                                          color: !isNewRequest
                                              ? Colors.white
                                              : kTitleColor)))))),
                  const SizedBox(width: 10.0),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isNewRequest = !isNewRequest;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: isNewRequest
                                      ? kMainColor
                                      : kMainColor.withOpacity(0.1)),
                              child: Center(
                                  child: Text('New Request',
                                      style: kTextStyle.copyWith(
                                          color: isNewRequest
                                              ? Colors.white
                                              : kTitleColor))))))
                ]),
                const SizedBox(height: 20.0),
                isNewRequest
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text('Mode of Convenience', style: kTextStyle),
                            const SizedBox(height: 15.0),
                            SizedBox(
                                height: 60.0,
                                child: FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          labelStyle: kTextStyle,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0))),
                                      child: DropdownButtonHideUnderline(
                                          child: getModeOfConvenience()));
                                })),
                            const SizedBox(height: 30.0),
                            Text('Purpose', style: kTextStyle),
                            const SizedBox(height: 15.0),
                            AppTextField(
                                textFieldType: TextFieldType.NAME,
                                minLines: 8,
                                maxLines: 12,
                                decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: '',
                                    border: OutlineInputBorder())),
                            const SizedBox(height: 40.0),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: kMainColor),
                                    child: Text('Start Tour',
                                        style: kTextStyle.copyWith(
                                            color: Colors.white))))
                          ])
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Column(children: [
                              ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  onTap: () {
                                    // const EmployeeDetails().launch(context);
                                  },
                                  title:
                                      Text('Company Name', style: kTextStyle),
                                  subtitle: Text(
                                      'This is a test purpose actual data will show here',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor))),
                              const SizedBox(height: 10.0),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      Expanded(
                                          child: Text('From',
                                              style: kTextStyle.copyWith(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Expanded(
                                          child: Text('To',
                                              style: kTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold)))
                                    ]),
                                    const Divider(
                                        thickness: 1.0, color: kGreyTextColor),
                                    const SizedBox(height: 20.0),
                                    Row(children: [
                                      Expanded(
                                          child: Text('10-06-2021',
                                              style: kTextStyle.copyWith(
                                                  color: kGreyTextColor))),
                                      Expanded(
                                          child: Text('11-06-2021',
                                              style: kTextStyle.copyWith(
                                                  color: kGreyTextColor)))
                                    ])
                                  ]),
                              const SizedBox(height: 20.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: 30.0,
                                            right: 30.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: kMainColor),
                                        child: Text('Submit',
                                            style: kTextStyle.copyWith(
                                                color: Colors.white))),
                                    const SizedBox(width: 10.0),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: 30.0,
                                            right: 30.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                kAlertColor.withOpacity(0.1)),
                                        child: Text('Cancel',
                                            style: kTextStyle.copyWith(
                                                color: kAlertColor)))
                                  ]),
                              const SizedBox(height: 10.0)
                            ])),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: 5)
              ]))
        ])));
  }
}
