import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'all_cities.dart';

void main(List<String> arguments) async {
/*
    With this code, all cities and districts
    are drawn and written to the cities.txt file.
    Cities.txt already contains all the records.
    You don't need to run the code again.
 */

  var result = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/lutangar/cities.json/master/cities.json'));

  var decodedData = jsonDecode(result.body);

  var myFile = File('./bin/cities.txt');
  var allCitiesList = "";
  for (var item in decodedData) {
    print(item);
    allCitiesList += '"${item['name']}",';
  }
  allCitiesList = allCitiesList.substring(0, allCitiesList.length - 1);
  String finalText = '"["$allCitiesList"]"';
  myFile.writeAsString(finalText);

  //print(AllCities().list.length);
}
