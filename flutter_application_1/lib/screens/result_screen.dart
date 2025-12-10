import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prediction_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = Provider.of<PredictionProvider>(context).result;

    return Scaffold(
      appBar: AppBar(title: const Text("Prediction Result")),
      body: Center(
        child: result == null
            ? const Text("No result")
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    result.predictedClass,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text("Confidence: ${(result.confidence * 100).toStringAsFixed(2)}%"),
                ],
              ),
      ),
    );
  }
}
