import 'package:Project/apilearnwork/userinsertdata.dart';
import 'package:Project/apiwork/api_response.dart';
import 'package:Project/apilearnwork/userinsertdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDatas
{
  static const api = "URL";
  static const headers = {
    'apiKey' : 'APIKEy',
    'Content-Type': 'application/josn'
  };  
  //SignUp
   Future<APIResponse<bool>> createUser(UserData item) {
     return http.post(api + '/tradenow', headers: headers, body: json.encode(item.toJson())).then((data) {
       if (data.statusCode == 201)
       {
         return APIResponse<bool>(data: true);

       }
       return APIResponse<bool>(error: true);
     })
     .catchError((_)=> APIResponse<bool>(error: true));
   }
   //Login
    Future loginUser(String username, String password) async  
   {
     final response = await http.post(api, headers: headers, body: {'username' : username, 'password': password});
     var convertedDatatoJson = jsonDecode(response.body);
     return convertedDatatoJson;
   }
    Future changePassword(String password) async  
   {
     final response = await http.post(api, headers: headers, body: {'password': password});
     var convertedDatatoJson = jsonDecode(response.body);
     return convertedDatatoJson;
   }
      Future enterEmail(String email) async  
   {
     final response = await http.post(api, headers: headers, body: {'email': email});
     var convertedDatatoJson = jsonDecode(response.body);
     return convertedDatatoJson;
   }
}