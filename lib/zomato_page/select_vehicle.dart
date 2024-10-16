import 'package:flutter/material.dart';
import 'package:untitled2/zomato_page/select_city.dart';
import 'motocycle_scooty.dart';

class SelectVehiclePage extends StatefulWidget {
  const SelectVehiclePage({super.key});

  @override
  State<SelectVehiclePage> createState() => _SelectVehiclePage();
}

class _SelectVehiclePage extends State<SelectVehiclePage> {
  String? _selectedVehicle;

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

  void _handleVehicleSelection(String? value) {
    setState(() {
      _selectedVehicle = value;
    });
    if (value == 'Motorcycle/Scooty') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MotocycleScooty(),
        ),
      );
    }
  }

  void _navigateBasedOnSelection() {
    if (_selectedVehicle == 'Motorcycle/Scooty') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MotocycleScooty(),
        ),
      );
    } else if (_selectedVehicle == 'Electric Vehicle(EV)') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectCityPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a vehicle to proceed.'),
        ),
      );
    }
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
        title: Text('Selecting Vehicle'),
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
                                '----------- CHOOSE VEHICLE ----------',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Motorcycle/Scooty'),
                                  Radio<String>(
                                    value: 'Motorcycle/Scooty',
                                    groupValue: _selectedVehicle,
                                    onChanged: _handleVehicleSelection,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Divider(),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Electric Vehicle(EV)'),
                                  Radio<String>(
                                    value: 'Electric Vehicle(EV)',
                                    groupValue: _selectedVehicle,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedVehicle = value;
                                      });
                                    },
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
                        onPressed: _navigateBasedOnSelection,
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
