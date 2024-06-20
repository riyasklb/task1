import 'package:dotted_border/dotted_border.dart' as dotted;
import 'package:easy_stepper/easy_stepper.dart' as stepper;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OnboardVehiclePage extends StatefulWidget {
  @override
  _OnboardVehiclePageState createState() => _OnboardVehiclePageState();
}

class _OnboardVehiclePageState extends State<OnboardVehiclePage> {
  bool pickupLocation = false;
  List<File?> _images = List.filled(6, null);
  List<String> imageLabels = [
    'Front',
    'Back',
    'Top',
    'Left',
    'Right',
    'DashBoard'
  ];
  int activeStep = 0;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        title: Text(
          'Onboard Vehicle',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              SizedBox(height: 10),
              stepper.EasyStepper(
                activeStep: activeStep,
                //  stepShape: stepper.StepShape.rRectangle,
                // stepBorderRadius: 15,
                borderThickness: 2,
                stepRadius: 28,
                finishedStepBorderColor: Colors.deepOrange,
                finishedStepTextColor: Colors.deepOrange,
                finishedStepBackgroundColor: Colors.deepOrange,
                activeStepIconColor: Colors.deepOrange,
                showLoadingAnimation: false,
                steps: [
                  stepper.EasyStep(
                    customStep: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Opacity(
                        opacity: activeStep >= 0 ? 1 : 0.3,
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text('1',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      ),
                    ),
                    customTitle: const Text(
                      'Assessment',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  stepper.EasyStep(
                    customStep: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Opacity(
                        opacity: activeStep >= 0 ? 1 : 0.3,
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text('2',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      ),
                    ),
                    customTitle: const Text(
                      'RTO Alteration',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  stepper.EasyStep(
                    customStep: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Opacity(
                        opacity: activeStep >= 0 ? 1 : 0.3,
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text('3',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      ),
                    ),
                    customTitle: const Text(
                      'Dash 3',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by Inventory',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Replace parts',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: '  Mirrors\n  Breaks\n  Light',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Replace parts',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Vehicle Images',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(6, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: dotted.DottedBorder(
                              borderType: dotted.BorderType.RRect,
                              radius: Radius.circular(15),
                              // padding: EdgeInsets.all(6),
                              color: Colors.red,
                              strokeWidth: 1,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 14,
                                    ),
                                    _images[index] == null
                                        ? TextButton(
                                            onPressed: () => _pickImage(index),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey[100],
                                                    child: Icon(Icons.add,
                                                        color: Colors.red)),
                                              ],
                                            ),
                                          )
                                        : Image.file(
                                            _images[index]!,
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                    SizedBox(height: 5),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 250, 234, 223),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(13),
                                                bottomLeft:
                                                    Radius.circular(13))),
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              imageLabels[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+ Add More ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        )
                      ],
                    ),SizedBox(height: 10,)
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: pickupLocation,
                    onChanged: (bool? value) {
                      setState(() {
                        pickupLocation = value ?? false;
                      });
                    },
                  ),
                  Text('Pickup Location'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
