import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  @override
  State createState() => new _Maps();
}

class _Maps extends State<Maps> {List<Marker> allMarkers = [];

  GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    // allMarkers.add(Marker(
    //     markerId: MarkerId('myMarker'),
    //     draggable: true,
    //     onTap: () {
    //       print('Marker Tapped');
    //     },
    //     position: LatLng(27.6778563, 85.3146612)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Stack(
        children: [Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(27.664400, 85.318794), zoom: 12.0),
            markers: {
              ven1,ven2,ven3,ven4,ven5
            },
            onMapCreated: mapCreated,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: moveto,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green
              ),
              child: Icon(Icons.forward, color: Colors.white),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: InkWell(
        //     child: Container(
        //       height: 40.0,
        //       width: 40.0,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20.0),
        //         color: Colors.red
        //       ),
        //       child: Icon(Icons.backspace, color: Colors.white),
        //     ),
        //   ),
        // )
        ]
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveto() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(27.664400, 85.318794), zoom: 14.0, bearing: 45.0, tilt: 45.0),
    ));
  }

  // movetoNewYork() {
  //   _controller.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
  //   ));
  // }
}
Marker ven1 = Marker(
  markerId: MarkerId('ven1'),
  position: LatLng(27.6778563, 85.3146612),
  infoWindow: InfoWindow(title: 'Kupondole Banquet'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);
Marker ven2 = Marker(
  markerId: MarkerId('ven2'),
  position: LatLng(27.6768686,85.3200757),
  infoWindow: InfoWindow(title: 'Ashok Party Palace'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose
  ),
);

Marker ven3 = Marker(
  markerId: MarkerId('ven3'),
  position: LatLng(27.7169686,85.2819108),
  infoWindow: InfoWindow(title: 'Hotel Star Banquet'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);
Marker ven4 = Marker(
  markerId: MarkerId('ven4'),
  position: LatLng(27.714519,85.3011922),
  infoWindow: InfoWindow(title: 'Paradise Banquet'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);
Marker ven5 = Marker(
  markerId: MarkerId('ven5'),
  position: LatLng(27.7156169,85.2916815),
  infoWindow: InfoWindow(title: 'Swayambhu Peace Zone Hotel'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRose,
  ),
);