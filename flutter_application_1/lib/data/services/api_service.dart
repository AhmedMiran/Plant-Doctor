import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/prediction_response.dart';
import '../../core/constants/api_endpoints.dart';

class ApiService {
  static Future<PredictionResponse> uploadImage(File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse(predictEndpoint));
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseBody);

    return PredictionResponse.fromJson(jsonResponse);
  }
}
