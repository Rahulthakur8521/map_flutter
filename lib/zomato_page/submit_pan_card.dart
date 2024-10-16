import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/zomato_page/view_pan_card.dart';


class SubmitPanCard extends StatefulWidget {
  const SubmitPanCard({super.key});

  @override
  State<SubmitPanCard> createState() => _SubmitPanCardState();
}

class _SubmitPanCardState extends State<SubmitPanCard> {
  final TextEditingController _panNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  String? _selectedGender;
  File? _selectedImage;
  bool _isFormValid = false;
  String? _panNumberError;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _panNumberController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _fatherNameController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _panNumberError = _validatePanNumber(_panNumberController.text);
      _isFormValid = _panNumberError == null &&
          _nameController.text.isNotEmpty &&
          _dobController.text.isNotEmpty &&
          _fatherNameController.text.isNotEmpty &&
          _selectedGender != null &&
          _selectedImage != null;
    });
  }

  String? _validatePanNumber(String pan) {
    final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    if (pan.length != 10 || !panRegex.hasMatch(pan)) {
      return 'Invalid PAN number';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
        _validateForm();
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _validateForm();
      });
    }
  }

  Future<void> _saveData() async {
    try {
      DocumentReference documentRef = _firestore.collection('pan_cards').doc();
      String documentId = documentRef.id;

      await documentRef.set({
        'id': documentId,
        'pan_number': _panNumberController.text,
        'name': _nameController.text,
        'dob': _dobController.text,
        'father_name': _fatherNameController.text,
        'gender': _selectedGender,
        'image_url': _selectedImage != null ? _selectedImage!.path : null,
      });

      Fluttertoast.showToast(
        msg: "Data saved successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPanCard(
        panNumber: _panNumberController.text,
        name: _nameController.text,
        dob: _dobController.text,
        fatherName: _fatherNameController.text,
        gender: _selectedGender!,
        imageUrl: _selectedImage?.path ?? '',
      ),
      ),
      );

    } catch (e) {
      print('Error saving data: $e');
      Fluttertoast.showToast(
        msg: "Error saving data: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Submit PAN card'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: DottedBorder(
                    color: Colors.orange,
                    strokeWidth: 3,
                    dashPattern: [6, 6],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Container(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.8,
                      child: Center(
                        child: _selectedImage != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _selectedImage!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.camera_alt, color: Colors.orange, size: screenWidth * 0.1),
                            Text(
                              'Upload PAN card image',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),
                TextField(
                  controller: _panNumberController,
                  decoration: InputDecoration(
                    labelText: 'PAN number',
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorText: _panNumberError,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  onChanged: (value) => _validateForm(),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name on PAN card',
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  onChanged: (value) => _validateForm(),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today,color: Colors.orange,),
                      onPressed: () => _selectDate(context),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextField(
                  controller: _fatherNameController,
                  decoration: InputDecoration(
                    labelText: 'Father\'s Name',
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  onChanged: (value) => _validateForm(),
                ),


                SizedBox(height: screenHeight * 0.03),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                      _validateForm();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: screenHeight * 0.04),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.orange.withOpacity(0.5);
                          }
                          return Colors.orange;
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: _isFormValid ? _saveData : null,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
