// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/zomato_page/submit_document.dart';
//
// class SelectAreaPage extends StatefulWidget {
//   const SelectAreaPage({super.key});
//
//   @override
//   State<SelectAreaPage> createState() => _SelectAreaPage();
// }
//
// class _SelectAreaPage extends State<SelectAreaPage> {
//   String? _selectedLanguage;
//
//   void _showSupportBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Need help?',
//                     style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.width * 0.045,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Divider(),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.wifi_calling, color: Colors.orange),
//                       SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                       Text(
//                         'Call Zomato Support',
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.width * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Icon(Icons.arrow_forward),
//                 ],
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Padding(
//                 padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
//                 child: Text(
//                   'Talk to our agent for help',
//                   style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.width * 0.035,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showLogoutBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'More options',
//                     style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.width * 0.045,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Divider(),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.logout, color: Colors.orange),
//                       SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                       Text(
//                         'Logout',
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.width * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Icon(Icons.arrow_forward),
//                 ],
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Padding(
//                 padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
//                 child: Text(
//                   'Your progress will be saved',
//                   style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.width * 0.035,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Selecting work area'),
//         actions: [
//           ElevatedButton.icon(
//             onPressed: () {
//               _showSupportBottomSheet(context);
//             },
//             icon: Icon(Icons.wifi_calling, color: Colors.orange),
//             label: Text(
//               'Help',
//               style: TextStyle(color: Colors.orange),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.transparent,
//               shadowColor: Colors.transparent,
//             ),
//           ),
//           PopupMenuButton<String>(
//             color: Colors.white,
//             onSelected: (value) {
//               if (value == 'Logout') {
//                 _showLogoutBottomSheet(context);
//               }
//             },
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 value: 'Logout',
//                 child: Text('Logout'),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Image.network(
//             'https://img.freepik.com/free-vector/tangerine-fruit-yellow-background-design-resource_53876-173499.jpg',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Column(
//             children: [
//               Spacer(),
//               Padding(
//                 padding: EdgeInsets.all(screenWidth * 0.025),
//                 child: Column(
//                   children: [
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(screenWidth * 0.03),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Center(
//                               child: Text(
//                                 'SELECT WORK AREA',
//                                 style: TextStyle(fontSize: screenWidth * 0.05),
//                               ),
//                             ),
//                             SizedBox(height: screenHeight * 0.02),
//                             ListTile(
//                               title: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(Icons.location_on),
//                                       SizedBox(width: screenWidth * 0.02),
//                                       Text("Sadhpur, Chapra"),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "change",
//                                         style: TextStyle(color: Colors.orange),
//                                       ),
//                                       Icon(
//                                         Icons.arrow_right,
//                                         color: Colors.orange,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     SizedBox(
//                       height: screenHeight * 0.06,
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           backgroundColor: Colors.orange,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SubmitDocumentPage(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'Next',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/zomato_page/submit_document.dart';

class SelectAreaPage extends StatefulWidget {
  const SelectAreaPage({super.key});

  @override
  State<SelectAreaPage> createState() => _SelectAreaPage();
}

class _SelectAreaPage extends State<SelectAreaPage> {
  String? _selectedCity = "Chapra";

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Area',style: TextStyle(color: Colors.orange),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Amnour'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Amnour';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Bheldi'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Bheldi';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Parsa'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Parsa';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sonho'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Sonho';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Sonpur'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Sonpur';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Marhaura'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Marhaura';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Garkha'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Garkha';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Maker'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Maker';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Mashrakh'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Mashrakh';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Sadhpur chhapra'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Sadhpur chhapra';
                  });
                  Navigator.pop(context);
                },
              ),

            ],
          ),
        );
      },
    );
  }

  void _showSupportBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Need help?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wifi_calling, color: Colors.orange),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(
                        'Call Zomato Support',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Talk to our agent for help',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More options',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout, color: Colors.orange),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(
                        'Logout',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Your progress will be saved',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Selecting work Area'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              _showSupportBottomSheet(context);
            },
            icon: Icon(Icons.wifi_calling, color: Colors.orange),
            label: Text(
              'Help',
              style: TextStyle(color: Colors.orange),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {
              if (value == 'Logout') {
                _showLogoutBottomSheet(context);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            'https://www.shutterstock.com/image-photo/slices-whole-citruses-laid-out-260nw-1814765924.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.025),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                '------------SELECT WORK AREA------------',
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(width: screenWidth * 0.02),
                                      Text(_selectedCity!),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showCitySelectionDialog(context);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "change",
                                          style: TextStyle(color: Colors.orange),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      height: screenHeight * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubmitDocumentPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
