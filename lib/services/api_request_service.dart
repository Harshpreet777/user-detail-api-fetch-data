
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:getapi/model/api_request_model.dart';

class DataApiService{
  static Future<List<DataModel>> getData() async{
    List<DataModel> listData=[];
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    try{
      if(response.statusCode==200){
        if(response.body.isNotEmpty){
          listData=dataModelFromJson(response.body);
        }
      }
    }catch(e){
      log("Failed $e");
    }
    return listData;
  }
}