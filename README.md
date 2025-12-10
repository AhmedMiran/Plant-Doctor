# Plant-Doctor
This project is an end-to-end plant disease detection system built using Flutter, FastAPI, and TensorFlow. It allows users to upload plant leaf images through a mobile app and receive instant disease predictions powered by a trained deep learning model.

# Features

# Flutter Mobile App

Clean UI for uploading images <br>
Displays prediction results and confidence score/n
Communicates with FastAPI backend via REST APIs

# Machine Learning Model

Built using TensorFlow, CNN, and TensorFlow Pipeline /n
Custom dataset preprocessing & augmentation /n
Achieved 98% accuracy on test data/n
Optimized for fast inference

# FastAPI Backend

Receives image uploads from the app/n
Loads and runs the trained TensorFlow model/n
Returns prediction + confidence/n
Deployed on Railway (web service)
