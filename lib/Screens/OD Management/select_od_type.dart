import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
import 'od_request.dart';
import 'tour_request.dart';

class SelectODType extends StatefulWidget {
  const SelectODType({Key? key}) : super(key: key);

  @override
  _SelectODTypeState createState() => _SelectODTypeState();
}

class _SelectODTypeState extends State<SelectODType> {
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
            title: Text('Please Select',
                maxLines: 2,
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20.0),
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
                    Material(
                        elevation: 2.0,
                        child: GestureDetector(
                            onTap: () =>
                                const ODRequest().launch(context),
                            child: Container(
                                width: context.width(),
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            color: Color(0xFF7D6AEF),
                                            width: 3.0)),
                                    color: Colors.white),
                                child: ListTile(
                                    leading: const Image(
                                        image: AssetImage(
                                            'images/employeelist.png')),
                                    title: Text('OD',
                                        maxLines: 2,
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold)),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios))))),
                    const SizedBox(height: 20.0),
                    Material(
                        elevation: 2.0,
                        child: Container(
                            width: context.width(),
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Color(0xFFFD73B0), width: 3.0)),
                                color: Colors.white),
                            child: ListTile(
                                onTap: () => const TourRequest()
                                    .launch(context),
                                leading: const Image(
                                    image: AssetImage(
                                        'images/timeattendance.png')),
                                title: Text('Tour',
                                    maxLines: 2,
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold)),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios)))),
                    const SizedBox(height: 20.0)
                  ])))
        ]));
  }
}
