# Flutter-Chat-app

A real-time cross-platform chat application built with **Flutter** and **Firebase**. This project demonstrates state management, real-time database integration, and secure user authentication.

## Demo
<img width="1280" height="2856" alt="untitled" src="https://github.com/user-attachments/assets/ae310ff9-a29f-4ff9-ada4-599cdcd96fcf" />


## Features

* **Real-time Messaging:** Messages sync instantly across all devices using Firestore Streams.
* **User Authentication:** Secure signup and login flow via Firebase Auth.
* **Dynamic UI:** Optimized chat bubbles that group messages from the same user for a clean aesthetic.
* **Adaptive Avatars:** Intelligent logic that displays user-specific images or a local fallback placeholder to optimize cloud resources.
* **Reverse-Chronological Feed:** Messages are displayed in a familiar bottom-to-top list format.

## Tech Stack

* **Frontend:** [Flutter](https://flutter.dev/) (Dart)
* **Backend/Database:** [Cloud Firestore](https://firebase.google.com/docs/firestore)
* **Authentication:** [Firebase Auth](https://firebase.google.com/docs/auth)

## Architecture & Logic Highlights

### Efficient Image Handling
To keep the project lean, the application implements a safe fallback mechanism for user profile pictures. Instead of relying purely on cloud storage, the logic checks for valid image URLs and defaults to a local asset when data is missing.

## Setup & Installation

Follow these steps to get a local copy of the project up and running.

### 1. Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (Latest Stable Version)
* A [Firebase](https://console.firebase.google.com/) account

### 2. Clone the Repository
```bash
git clone https://github.com/Yhwach14/flutter-chat-app.git
cd flutter-chat-app
