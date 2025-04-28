import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test_application/components/toolbar.dart';
import 'package:flutter_test_application/config/app_strings.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget{
  const NearbyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title:AppStrings.nearby),
      body:FlutterMap(options: MapOptions(
         initialCenter: LatLng(51.509364, -0.128928),
         initialZoom: 10
      ), children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',)
      ],
      ),
    );
  }
}