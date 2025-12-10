import 'dart:io';
import 'package:flutter/material.dart';
import '../data/services/api_service.dart';
import '../data/models/prediction_response.dart';

class PredictionProvider with ChangeNotifier {
  PredictionResponse? result;
  bool isLoading = false;

  Future<void> predict(File image) async {
    isLoading = true;
    notifyListeners();

    try {
      result = await ApiService.uploadImage(image);
    } catch (e) {
      debugPrint("Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
