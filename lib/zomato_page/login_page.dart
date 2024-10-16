
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'otp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/jbAjM.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Welcome Back 👋",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700),
                            ),
                            Text("Enter your phone number to continue."),
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: _formKey,
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                  showFlags: true,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: TextStyle(color: Colors.black),
                                initialValue: number,
                                textFieldController: phoneController,
                                inputBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                formatInput: true,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true
                                ),
                                inputDecoration: InputDecoration(
                                  labelText: "Enter your phone number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Phone number is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      final phoneNumber = number.phoneNumber!;
                                      await FirebaseAuth.instance.verifyPhoneNumber(
                                        phoneNumber: phoneNumber,
                                        verificationCompleted: (PhoneAuthCredential credential) {

                                        },
                                        verificationFailed: (FirebaseAuthException ex) {
                                          if (ex.code == 'invalid-phone-number') {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Invalid phone number.')),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text(ex.message!)),
                                            );
                                          }
                                        },
                                        codeSent: (String verificationId, int? resendToken) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OtpVerificationPage(verificationid: verificationId),
                                            ),
                                          );
                                        },
                                        codeAutoRetrievalTimeout: (String verificationId) {},
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Failed to verify phone number: ${e.toString()}')),
                                      );
                                    }
                                  }
                                },
                                child: Text("Continue"),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





