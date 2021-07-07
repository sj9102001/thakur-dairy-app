import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _previewImageUrl == null
              ? Text('No Location Chosen!')
              : Image.network(_previewImageUrl,
                  fit: BoxFit.cover, width: double.infinity),
        ),
        Row(
          children: [
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
