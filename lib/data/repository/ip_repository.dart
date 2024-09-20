// any operation done to make the raw data to structure data in repository

import 'dart:convert';
import 'dart:developer';

import 'package:cubit_demo/data/data_provider/ip_data_provider.dart';

import '../model/ip_details.dart';

class IpRepository {
  Future<IPDetailsModel?> getIPDetails() async {
    try {
      final res = await IpDataProvider().getIpDetailsResponse();
      if (res == null) return null;
      return IPDetailsModel.fromJson(jsonDecode(res));
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
