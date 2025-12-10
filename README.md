# Plant-Doctor
This project is an end-to-end plant disease detection system built using Flutter, FastAPI, and TensorFlow. It allows users to upload plant leaf images through a mobile app and receive instant disease predictions powered by a trained deep learning model.

# Features

# Flutter Mobile App

Clean UI for uploading images <br>
Displays prediction results and confidence score<br>
Communicates with FastAPI backend via REST APIs

# Machine Learning Model

Built using TensorFlow, CNN, and TensorFlow Pipeline <br>
Custom dataset preprocessing & augmentation <br>
Achieved 98% accuracy on test data <br>
Optimized for fast inference

# FastAPI Backend

Receives image uploads from the app <br>
Loads and runs the trained TensorFlow model <br>
Returns prediction + confidence <br>
Deployed on Railway (web service)
