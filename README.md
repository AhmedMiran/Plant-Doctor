# Plant-Doctor
This project is an end-to-end plant disease detection system built using Flutter, FastAPI, and TensorFlow. It allows users to upload plant leaf images through a mobile app and receive instant disease predictions powered by a trained deep learning model.

Features

Flutter Mobile App

Clean UI for uploading images

Displays prediction results and confidence score

Communicates with FastAPI backend via REST APIs

Machine Learning Model

Built using TensorFlow, CNN, and TensorFlow Pipeline

Custom dataset preprocessing & augmentation

Achieved 98% accuracy on test data

Optimized for fast inference

FastAPI Backend

Receives image uploads from the app

Loads and runs the trained TensorFlow model

Returns prediction + confidence

Deployed on Railway (web service)
