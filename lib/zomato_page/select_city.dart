//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/zomato_page/select_area.dart';
//
// class SelectCityPage extends StatefulWidget {
//   const SelectCityPage({super.key});
//
//   @override
//   State<SelectCityPage> createState() => _SelectCityPage();
// }
//
// class _SelectCityPage extends State<SelectCityPage> {
//   String? _selectedVehicle;
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
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
//                   style: TextStyle(fontSize: 13),
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
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
//                   style: TextStyle(fontSize: 13),
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
//         title: Text('Selecting work city'),
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
//             'https://www.shutterstock.com/image-photo/slices-whole-citruses-laid-out-260nw-1814765924.jpg',
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
//                                 'SELECT WORK CITY',
//                                 style: TextStyle(fontSize: screenWidth * 0.04),
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
//                                       Text("Chapra"),
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
//                               builder: (context) => SelectAreaPage(),
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
import 'package:untitled2/zomato_page/select_area.dart';

class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPage();
}

class _SelectCityPage extends State<SelectCityPage> {
  String? _selectedCity = "Chapra";

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select City',style: TextStyle(color: Colors.orange),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Chapra'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Chapra';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Patna'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Patna';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Gaya'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Gaya';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Muzaffarpur'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Muzaffarpur';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Hajipur'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Hajipur';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Bhagalpur'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Bhagalpur';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Siwan'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Siwan';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Motihari'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Motihari';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Ara'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Ara';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Samatipur'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Samatipur';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Gopalganj'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Gopalganj';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text('Nalanda'),
                onTap: () {
                  setState(() {
                    _selectedCity = 'Nalanda';
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
        title: Text('Selecting work city'),
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
                                '------------SELECT WORK CITY------------',
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
                              builder: (context) => SelectAreaPage(),
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
