import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bank_view.dart';

class BankDetails extends StatefulWidget {
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();

  String? selectedBank;
  final List<String> bankNames = [
    'HDFC Bank',
    'ICICI Bank',
    'State Bank of India',
    'Axis Bank',
    'Kotak Mahindra Bank',
    'Punjab National Bank',
    'Bank of Baroda',
    'Canara Bank',
    'Yes Bank',
    'IDFC Bank',
    'Bandhan Bank',
    'Central Bank of India',
    'Bank of India'
  ];

  Future<void> addBankDetailsToFirestore() async {
    try {
      CollectionReference bankDetails = FirebaseFirestore.instance.collection('bank_Details');

      await bankDetails.add({
        'bankName': selectedBank ?? 'N/A',
        'accountHolderName': nameController.text,
        'ifscCode': ifscController.text,
        'accountNumber': accountController.text,
        'aadharNumber': aadharController.text,
      });

      print("Bank details added successfully!");
    } catch (e) {
      print("Failed to add bank details: $e");
    }
  }

  String generateAccountNumber(String bankName) {
    Random random = Random();
    int accountNumberLength = 12 + random.nextInt(4); // Between 12 and 15 digits
    String accountNumber = '';
    for (int i = 0; i < accountNumberLength; i++) {
      accountNumber += random.nextInt(10).toString();
    }
    return accountNumber;
  }

  String maskAccountNumber(String accountNumber) {
    if (accountNumber.length > 4) {
      return '*' * (accountNumber.length - 4) + accountNumber.substring(accountNumber.length - 4);
    }
    return accountNumber;
  }

  String maskAadhaarNumber(String aadhaarNumber) {
    if (aadhaarNumber.length > 4) {
      return '*' * (aadhaarNumber.length - 4) + aadhaarNumber.substring(aadhaarNumber.length - 4);
    }
    return aadhaarNumber;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bank'),
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.3,
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bank2(2).jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bank Details',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DropdownButtonFormField<String>(
                    value: selectedBank,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBank = newValue!;
                        // Generate and set the account number based on the selected bank
                        accountController.text = generateAccountNumber(selectedBank!);
                      });
                    },
                    items: bankNames.map((bank) {
                      return DropdownMenuItem(
                        child: Text(bank),
                        value: bank,
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: "Bank Name",
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Account Holder's Name",
                      labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: TextField(
                controller: ifscController,
                decoration: InputDecoration(
                  labelText: 'IFSC Code',
                  labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: TextField(
                controller: accountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                obscureText: false,
                onChanged: (text) {
                  setState(() {
                    accountController.text = maskAccountNumber(text);
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: TextField(
                controller: aadharController,
                keyboardType: TextInputType.number,
                maxLength: 12,
                decoration: InputDecoration(
                  labelText: 'Aadhar number',
                  labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),

                obscureText: false,
                onChanged: (text) {
                  setState(() {
                    aadharController.text = maskAadhaarNumber(text);
                  });
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: SizedBox(
                height: screenHeight * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () async {
                    await addBankDetailsToFirestore();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BankView(
                          bankName: selectedBank ?? 'N/A',
                          accountHolderName: nameController.text,
                          ifscCode: ifscController.text,
                          accountNumber: accountController.text,
                          aadharNumber: aadharController.text,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Add Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
