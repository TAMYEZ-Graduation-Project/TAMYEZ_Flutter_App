import 'package:google_api_availability/google_api_availability.dart';

Future<bool> hasGoogleServices() async {
  GooglePlayServicesAvailability availability = await GoogleApiAvailability
      .instance
      .checkGooglePlayServicesAvailability();

  return availability == GooglePlayServicesAvailability.success;
}
