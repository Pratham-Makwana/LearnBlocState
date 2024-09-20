import 'dart:developer';

import 'package:http/http.dart';

/// Flow Of the Bloc/Cubit Architecture
/// Data Provider -> Repository -> Bloc/Cubit -> Presentation
/// The Work Of Data Provider is to give to row data
class IpDataProvider {
  Future<String?> getIpDetailsResponse() async {
    try {
      final res = await get(Uri.parse('http://ip-api.com/json'));
      return res.body;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
