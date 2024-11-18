# Firebase Authentication and Secure Caller ID App

## Overview

This Flutter app implements Firebase Authentication to allow users to sign in using different methods: Email/Password, Fingerprint, Google, and GitHub. Once logged in, users are directed to a home dashboard where they can access their profile data securely through a PIN or Fingerprint passkey. The profile includes the user's name, email, phone number, address, date of birth, and a profile image.

## Features

- **User Authentication:**
  - Sign in with Email/Password
  - Sign in with Fingerprint (if already logged in)
  - Sign in with Google
  - Sign in with GitHub
- **Home Dashboard:**
  - Displays user profile information: Name, Email, Phone Number, Address, Date of Birth, Profile Image.
  - Secure Caller ID accessible by PIN or Fingerprint.

### Prerequisites

- Flutter (>=3.x.x)
- Firebase project with Firebase Authentication enabled (Email/Password, Google, and GitHub sign-in methods).
- Android/iOS Emulator or Physical Device for testing.
  
### Step 1: Set Up Firebase

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable Firebase Authentication:
   - Go to the "Authentication" section.
   - Enable Email/Password, Google, and GitHub sign-in methods.
3. Add Firebase to your Flutter project:
   - Follow the instructions to add Firebase SDK to your app for both Android and iOS:
     - [FlutterFire documentation](https://firebase.flutter.dev/docs/overview)

### Step 2: Configure Firebase in Your Flutter Project

1. Add the necessary dependencies in `pubspec.yaml` file:

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  go_router: ^14.6.0
  bloc: ^8.1.4
  firebase_core: ^3.8.0
  firebase_auth: ^5.3.3
  cloud_firestore: ^5.5.0
  flutter_bloc: ^8.1.6
  flutter_svg: ^2.0.14
  github_oauth: ^0.0.2
  google_sign_in: ^6.2.2
  fluttertoast: ^8.2.8
  flutter_dotenv: ^5.2.1
  flutter_web_auth_2: ^4.0.1
  http: ^1.2.2
  local_auth: ^2.3.0
  permission_handler: ^11.3.1
