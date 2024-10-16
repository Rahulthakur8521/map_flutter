import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AadhaarVerification extends StatefulWidget {
  const AadhaarVerification({super.key, required String aadhaarNumber});

  @override
  State<AadhaarVerification> createState() => _AadhaarVerification();
}

class _AadhaarVerification extends State<AadhaarVerification> {
  bool _isSelected = false;
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  void dispose() {
    _aadharController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Aadhaar Verification'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: _toggleSelection,
                  child: CircleAvatar(
                    radius: screenWidth * 0.25,
                    backgroundColor: _isSelected ? Colors.blue : Colors.grey,
                    child: CircleAvatar(
                      radius: screenWidth * 0.25,
                      backgroundImage: NetworkImage(
                          "https://5.imimg.com/data5/SELLER/Default/2022/9/ZK/CB/SF/4910836/aadhar-card-software-500x500.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Enter Aadhar details for verification",
                style: TextStyle(fontSize: screenWidth * 0.040),
              ),
              SizedBox(height: screenHeight * 0.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aadhar number',
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.orange),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextField(
                      controller: _aadharController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your 12-digit Aadhar number',
                        suffixIcon: _aadharController.text.isEmpty
                            ? null
                            : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _aadharController.clear();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTP',
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.orange),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter OTP',
                        suffixIcon: _otpController.text.isEmpty
                            ? null
                            : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _otpController.clear();
                          },
                        ),
                      ),
                      inputFormatters: [AadharInputFormatter()],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'OTP sent to Aadhar-linked mobile number.',
                      style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                height: screenHeight * 0.07,
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Complete Aadhar OTP Verification',
                    style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.045),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Text(
                  '''Zomato does not collect or store any Aadhaar information. We assure Real-time ID verification & 100% security with 256-bit encryption. By clicking on Send OTP, you consent to sharing your Aadhaar details with Surepass for offline verification purposes and agree to the''',
                  style: TextStyle(fontSize: screenWidth * 0.03),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Center(
                child: Text(
                    '"terms and conditions"',
                  style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.035),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AadharInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final newText = text.replaceAll(' ', '');
    String formatted = '';

    for (int i = 0; i < newText.length; i++) {
      formatted += newText[i];
      if ((i + 1) % 4 == 0 && i + 1 != newText.length) {
        formatted += ' ';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: newValue.selection.copyWith(
        baseOffset: formatted.length,
        extentOffset: formatted.length,
      ),
    );
  }
}
