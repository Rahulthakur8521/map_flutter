import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/zomato_page/update_pan_card.dart';

class ViewPanCard extends StatefulWidget {
  String panNumber;
  String name;
  String dob;
  String fatherName;
  String gender;
  String imageUrl;

  ViewPanCard({
    required this.panNumber,
    required this.name,
    required this.dob,
    required this.fatherName,
    required this.gender,
    required this.imageUrl,
  });

  @override
  _ViewPanCardState createState() => _ViewPanCardState();
}

class _ViewPanCardState extends State<ViewPanCard> {
  late TextEditingController _panNumberController;
  late TextEditingController _nameController;
  late TextEditingController _dobController;
  late TextEditingController _fatherNameController;
  late String _selectedGender;
  late String _imageUrl;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _panNumberController = TextEditingController(text: widget.panNumber);
    _nameController = TextEditingController(text: widget.name);
    _dobController = TextEditingController(text: widget.dob);
    _fatherNameController = TextEditingController(text: widget.fatherName);
    _selectedGender = widget.gender;
    _imageUrl = widget.imageUrl;
  }

  @override
  void dispose() {
    _panNumberController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _fatherNameController.dispose();
    super.dispose();
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
      });
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Pan Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageUrl.isNotEmpty
                  ? Image.file(
                File(_imageUrl),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              )
                  : Container(),
              SizedBox(height: 20),
              TextField(
                controller: _panNumberController,
                decoration: InputDecoration(
                  labelText: 'PAN Number',
                  enabled: false,
                  labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name on PAN card',
                  enabled: false,
                  labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _dobController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  enabled: false,
                  labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.orange,
                    ),
                    onPressed: () => _selectDate(context),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _fatherNameController,
                decoration: InputDecoration(
                  labelText: 'Father\'s Name',
                  enabled: false,
                  labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: ['Male', 'Female', 'Other']
                    .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                  enabled: false,
                  labelStyle: TextStyle(color: Colors.orange, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              SizedBox(height: 25),
             SizedBox(
               height: 50,
               width: double.infinity,
               child:  ElevatedButton(
                 onPressed: () async {
                   final updatedData = await Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => UpdatePanCard(
                         panNumber: _panNumberController.text,
                         name: _nameController.text,
                         dob: _dobController.text,
                         fatherName: _fatherNameController.text,
                         gender: _selectedGender,
                         imageUrl: _imageUrl,
                       ),
                     ),
                   );

                   if (updatedData != null) {
                     setState(() {
                       _panNumberController.text = updatedData['panNumber'];
                       _nameController.text = updatedData['name'];
                       _dobController.text = updatedData['dob'];
                       _fatherNameController.text = updatedData['fatherName'];
                       _selectedGender = updatedData['gender'];
                       _imageUrl = updatedData['imageUrl'];
                     });
                   }
                 },
                 child: Text('Edit'),
               ),
             )

            ],
          ),
        ),
      ),
    );
  }
}
