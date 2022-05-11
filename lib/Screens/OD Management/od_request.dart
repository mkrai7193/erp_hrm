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
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final departureDateController = TextEditingController();
  final arrivalDateController = TextEditingController();

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
                      const SizedBox(height: 10.0),
                      Text('From Date', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      AppTextField(
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
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.date_range_rounded,
                                color: kGreyTextColor)),
                      ),
                      const SizedBox(height: 20.0),
                      Text('To Date', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        readOnly: true,
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          toDateController.text =
                              date.toString().substring(0, 10);
                        },
                        controller: toDateController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.date_range_rounded,
                                color: kGreyTextColor)),
                      ),
                      const SizedBox(height: 20.0),
                      Text('Place for', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: '',
                              border: OutlineInputBorder())),
                      const SizedBox(height: 20.0),
                      Text('Purpose', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: '',
                              border: OutlineInputBorder())),
                      const SizedBox(height: 20.0),
                      Text('Remarks', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: '',
                              border: OutlineInputBorder())),
                      const SizedBox(height: 20.0),
                      Text('Departure', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('*Place', style: kTextStyle),
                                  const SizedBox(height: 10.0),
                                  AppTextField(
                                      textFieldType: TextFieldType.NAME,
                                      decoration: const InputDecoration(
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                          hintText: '',
                                          border: OutlineInputBorder())),
                                ])),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('*Time', style: kTextStyle),
                                  const SizedBox(height: 10.0),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    readOnly: true,
                                    onTap: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100));
                                      departureDateController.text =
                                          date.toString().substring(0, 10);
                                    },
                                    controller: departureDateController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                        suffixIcon: Icon(Icons.date_range_rounded,
                                            color: kGreyTextColor)),
                                  ),
                                ])),
                      ]),
                      const SizedBox(height: 20.0),
                      Text('Arrival', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('*Place', style: kTextStyle),
                                  const SizedBox(height: 10.0),
                                  AppTextField(
                                      textFieldType: TextFieldType.NAME,
                                      decoration: const InputDecoration(
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                          hintText: '',
                                          border: OutlineInputBorder())),
                                ])),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('*Time', style: kTextStyle),
                                  const SizedBox(height: 10.0),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    readOnly: true,
                                    onTap: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100));
                                      arrivalDateController.text =
                                          date.toString().substring(0, 10);
                                    },
                                    controller: arrivalDateController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                        suffixIcon: Icon(Icons.date_range_rounded,
                                            color: kGreyTextColor)),
                                  ),
                                ])),
                      ]),
                      const SizedBox(height: 20.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Text('*Mode:', style: kTextStyle)),
                        Expanded(child: SizedBox(
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
                      const SizedBox(height: 20.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Text('*Class:', style: kTextStyle)),
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
                                  })),
                        )
                      ]),
                      const SizedBox(height: 20.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Text('*Owned By:', style: kTextStyle)),
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
                                  })),
                        )
                      ]),
                      const SizedBox(height: 20.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Text('*Distance(K.M.):', style: kTextStyle)),
                        Expanded(child: AppTextField(
                            textFieldType: TextFieldType.NAME,
                            decoration: const InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: '',
                                border: OutlineInputBorder())))
                      ]),
                      const SizedBox(height: 30.0),
                      Row(children: [
                        const Spacer(),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kMainColor),
                            child: Text('Refresh',
                                style: kTextStyle.copyWith(color: Colors.white))),
                        const SizedBox(width: 20),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kMainColor),
                            child: Text('Add New',
                                style: kTextStyle.copyWith(color: Colors.white))),
                        const Spacer()
                      ]),
                      const SizedBox(height: 30.0),
                      Text('Select File :', style: kTextStyle),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 60.0,
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          enabled: true,
                          decoration: InputDecoration(
                            labelText: 'Choose File',
                            hintText: 'No File Chosen',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: Image.asset('images/choosefile.png'),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: kMainColor),
                          child: Text('Attach',
                              style: kTextStyle.copyWith(color: Colors.white))),
                      const SizedBox(height: 30.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                            child: Text('Forwarded To:', style: kTextStyle)),
                        Expanded(child: SizedBox(
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
                      const SizedBox(height: 30.0),
                      Row(children: [
                        const Spacer(),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kMainColor),
                            child: Text('Submit',
                                style: kTextStyle.copyWith(color: Colors.white))),
                        const SizedBox(width: 20),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kMainColor),
                            child: Text('Reset',
                                style: kTextStyle.copyWith(color: Colors.white))),
                        const SizedBox(width: 20),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kMainColor),
                            child: Text('Close',
                                style: kTextStyle.copyWith(color: Colors.white))),
                        const Spacer()
                      ]),
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
