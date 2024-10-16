//map location
// import 'package:flutter/material.dart';
// import 'package:flutter_google_maps_webservices/places.dart';
// import 'package:geocoding/geocoding.dart' as geocoding;
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:async';
// import '../controller/direction_controller.dart';
//
// class SearchLocation extends StatefulWidget {
//   SearchLocation(
//       {Key? key, required this.pickupLatitude, required this.pickupLongitude})
//       : super(key: key);
//   final double pickupLatitude;
//   final double pickupLongitude;
//
//   @override
//   State<SearchLocation> createState() => _SearchLocationState();
// }
//
// class _SearchLocationState extends State<SearchLocation> {
//   TextEditingController seconddesnationController = TextEditingController();
//   var directionController = Get.put(DirectionAndDurationController());
//   List<Prediction> _suggestions = [];
//   Timer? _debounce;
//   String pickupAddress = '';
//   LatLng? _pickupLatLng;
//   late GoogleMapController _mapController;
//   Marker? _selectedLocationMarker;
//
//   @override
//   void initState() {
//     getAddress();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//         title: Text(
//           "Enter Pickup location",
//           style: TextStyle(
//               color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _pickupLatLng ??
//                   LatLng(widget.pickupLatitude, widget.pickupLongitude),
//               zoom: 14,
//             ),
//             onMapCreated: (controller) {
//               _mapController = controller;
//             },
//             markers: _selectedLocationMarker != null
//                 ? {_selectedLocationMarker!}
//                 : {},
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 buildSearchField(seconddesnationController,
//                     'Enter Pickup location', _onSearchTextChanged),
//                 SizedBox(height: 10),
//                 Expanded(child: _addressItemView(_suggestions, context)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSearchField(TextEditingController controller, String hintText,
//       Function(String) onChanged) {
//     return Container(
//       height: 55,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Color(0xffF0F1F3),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.location_on,
//               color: Colors.grey[700],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: TextField(
//                 controller: controller,
//                 onChanged: onChanged,
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       controller.clear();
//                       setState(() {
//                         _suggestions.clear();
//                       });
//                     },
//                     icon: Icon(Icons.close),
//                   ),
//                   hintText: hintText,
//                   hintStyle: TextStyle(
//                     color: Colors.grey[700],
//                     fontSize: 18,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _addressItemView(List<Prediction> prediction, BuildContext context) {
//     return prediction.isNotEmpty
//         ? ListView.builder(
//         shrinkWrap: true,
//         itemCount: prediction.length,
//         itemBuilder: (context, index) {
//           var address = prediction[index].description ?? 'Unknown address';
//           return InkWell(
//             onTap: () async {
//               var location = await getLatLngFromAddress(address);
//               if (location.latitude != 0.0 && location.longitude != 0.0) {
//                 setState(() {
//                   _selectedLocationMarker = Marker(
//                     markerId: MarkerId('selected-location'),
//                     position: LatLng(location.latitude, location.longitude),
//                     infoWindow: InfoWindow(
//                       title: address,
//                     ),
//                   );
//                   _mapController.animateCamera(
//                     CameraUpdate.newLatLng(
//                         LatLng(location.latitude, location.longitude)),
//                   );
//                   seconddesnationController.text = address;
//                   _suggestions.clear(); // Close suggestion list
//                 });
//                 directionController.pickup.value = address;
//               }
//             },
//             child: ListTile(
//               title: Text(address),
//               trailing: Icon(Icons.favorite_border),
//             ),
//           );
//         })
//         : Center(
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               getAddress();
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(right: 150),
//               // child: Text("Use My Current Location"),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 260, top: 20),
//             // child: Text(
//             //   "History",
//             //   style: TextStyle(color: Colors.black, fontSize: 17),
//             ),
//         ],
//       ),
//     );
//   }
//
//   void _onSearchTextChanged(String text) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       if (text.isNotEmpty) {
//         _fetchSuggestions(text);
//       }
//     });
//   }
//
//   void _fetchSuggestions(String input) async {
//     final places = GoogleMapsPlaces(
//         apiKey: 'AIzaSyCiJLymeCL0CTqTmcmPJ5T0lkLwA02OxWg');
//     PlacesAutocompleteResponse response = await places.autocomplete(input);
//     if (response.isOkay) {
//       setState(() {
//         _suggestions = response.predictions!;
//       });
//     } else {
//       print('Error fetching suggestions: ${response.errorMessage}');
//     }
//   }
//
//   Future<geocoding.Location> getLatLngFromAddress(String address) async {
//     var location = await geocoding.locationFromAddress(address);
//     return location.first;
//   }
//
//   Future<String> getAddressFromLatLong(
//       {required double latitude, required double longitude}) async {
//     List<geocoding.Placemark> placeMarks =
//     await geocoding.placemarkFromCoordinates(latitude, longitude);
//     geocoding.Placemark place = placeMarks[0];
//     var address =
//         '${place.locality}, ${place.administrativeArea}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.street}, ${place.name}, ${place.thoroughfare}, ${place.subThoroughfare}';
//     return address;
//   }
//
//   void getAddress() async {
//     pickupAddress = await getAddressFromLatLong(
//         latitude: widget.pickupLatitude, longitude: widget.pickupLongitude);
//
//     seconddesnationController.text = pickupAddress;
//     directionController.pickupAddress.value = pickupAddress;
//   }
// }
