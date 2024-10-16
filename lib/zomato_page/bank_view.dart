import 'package:flutter/material.dart';

class BankView extends StatelessWidget {
  final String bankName;
  final String accountHolderName;
  final String ifscCode;
  final String accountNumber;
  final String aadharNumber;

  BankView({
    required this.bankName,
    required this.accountHolderName,
    required this.ifscCode,
    required this.accountNumber,
    required this.aadharNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Details View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bank Name: $bankName'),
            Text('Account Holder Name: $accountHolderName'),
            Text('IFSC Code: $ifscCode'),
            Text('Account Number: $accountNumber'),
            Text('Aadhar Number: $aadharNumber'),
          ],
        ),
      ),
    );
  }
}
