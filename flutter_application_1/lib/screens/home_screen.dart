import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/prediction_provider.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? selectedImage;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PredictionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Plant Disease Detection")),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // 🔥 NEW: Container that shows uploaded image OR default logo
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.2),
                  image: DecorationImage(
                    image: selectedImage != null
                        ? FileImage(selectedImage!)  
                        : const AssetImage(
                            "assets/images/Green and White Plants Organic Logo.png",
                          ) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: pickImage,
                child: const Text("Pick Image"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: selectedImage == null
                    ? null
                    : () async {
                        final navigator = Navigator.of(context);
                        await provider.predict(selectedImage!);
                        if (!mounted) return;
                        navigator.push(
                          MaterialPageRoute(
                            builder: (_) => const ResultScreen(),
                          ),
                        );
                      },
                child: provider.isLoading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    : const Text("Predict"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
