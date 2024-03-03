
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Staticmap extends StatelessWidget {
  Staticmap({super.key, required this.location});
  final String location;
   
   String latitude = '';
   String longitude = '';
  final String apiKey = 'AIzaSyArLwdj4n4U2gZShrEaBLO7mPlzrhSjq1k';
  
  @override
  Widget build(BuildContext context) {
    List<String> locationParts = location.split(',');
    latitude = locationParts.isNotEmpty ? locationParts[0].trim() : '';
    longitude = locationParts.length > 1 ? locationParts[1].trim() : '';
    String staticMapUrl =
      'https://maps.googleapis.com/maps/api/staticmap?center=25.3643184,55.3982258&zoom=14&size=400x300&markers=color:red%7Clabel:A%7C25.3643184,55.3982258&key=AIzaSyArLwdj4n4U2gZShrEaBLO7mPlzrhSjq1k';

    return Scaffold(
      body: Center(
        child: Image.network(staticMapUrl),
      ),
    );
  }
}

