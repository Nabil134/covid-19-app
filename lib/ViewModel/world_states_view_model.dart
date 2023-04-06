import 'dart:convert';

import '../Model/world_states_model.dart';
import 'package:http/http.dart' as http;

import '../Services/Utilities/app_url.dart';

class WorldStatesViewModel {
  /*getProductsApi function start here*/
  Future<WorldStatesModel> fetchWorldRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  /*getProductsApi function end here*/

  /*getProductsApi function start here*/
  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    print(response.statusCode.toString());
    print(data);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }

  /*getProductsApi function end here*/
}
