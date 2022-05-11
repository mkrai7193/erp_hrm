import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';

class MisPunch extends StatefulWidget {
  const MisPunch({Key? key}) : super(key: key);

  @override
  _MisPunchState createState() => _MisPunchState();
}

class _MisPunchState extends State<MisPunch> {
  bool isNewRequest = false;
  String modeOfConvenience = '2021';
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  DropdownButton<String> getModeOfConvenience() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String modeOfConvenience in yearList) {
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
            title: Text('MisPunch',
                maxLines: 2,
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold))),
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
                      child: Text('Select Request Type', style: kTextStyle)),
                  Expanded(
                      child: SizedBox(
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
                          })))
                ]),
                const SizedBox(height: 15.0),
                Row(children: [
                  Expanded(child: Text('MisPunch Date', style: kTextStyle)),
                  Expanded(
                      child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            fromDateController.text =
                                date.toString().substring(0, 10);
                          },
                          controller: fromDateController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.date_range_rounded,
                                  color: kGreyTextColor))))
                ]),
                const SizedBox(height: 15.0),
                Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                  Expanded(child: Text('In Time', style: kTextStyle)),
                  const SizedBox(width: 5),
                  Expanded(child: Text('Out Time', style: kTextStyle))
                ]),
                const SizedBox(height: 5.0),
                Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                  Expanded(
                      child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            fromDateController.text =
                                date.toString().substring(0, 10);
                          },
                          controller: fromDateController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.date_range_rounded,
                                  color: kGreyTextColor)))),
                  const SizedBox(width: 5),
                  Expanded(
                      child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            fromDateController.text =
                                date.toString().substring(0, 10);
                          },
                          controller: fromDateController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.date_range_rounded,
                                  color: kGreyTextColor))))
                ]),
                const SizedBox(height: 15.0),
                Row(children: [
                  Expanded(child: Text('Reason', style: kTextStyle)),
                  Expanded(
                      child: SizedBox(
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
                          })))
                ]),
                const SizedBox(height: 15.0),
                Row(children: [
                  Expanded(child: Text('Remarks', style: kTextStyle)),
                  Expanded(
                      child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: '',
                              border: OutlineInputBorder())))
                ]),
                const SizedBox(height: 30.0),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kMainColor),
                    child: Text('Submit',
                        style: kTextStyle.copyWith(color: Colors.white)))
              ]))
        ])));
  }
}
