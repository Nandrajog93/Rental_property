import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;
import 'dart:html';

import 'package:web/src/dom/html.dart';

class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // Register the view factory for the web.
    // Ensure this runs only on the web.
    if (ui.platformViewRegistry != null) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
        final myLatlng = LatLng(1.3521, 103.8198);

        final mapOptions = MapOptions()
          ..zoom = 10
          ..center = LatLng(1.3521, 103.8198);

        final elem = DivElement()
          ..id = htmlId
          ..style.width = "99%"
          ..style.height = "100%"
          ..style.borderRadius = "20px"
          ..style.backgroundColor = "transparent"
          ..style.border = 'none';

        final map = GMap(elem as HTMLElement?, mapOptions);

        Marker(MarkerOptions()
          ..position = myLatlng
          ..map = map
          ..title = 'Hello World!'
        );

        return elem;
      });
    }

    return HtmlElementView(viewType: htmlId);
  }
}
