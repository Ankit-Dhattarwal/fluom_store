# Fluom 💻

A Flutter project with GetX state management and shared preferences for building an application with login, registration, email verification, and password reset functionalities.

## Getting Started 🚀

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Additional Features ✨

### State Management with GetX 🔄

This project utilizes GetX for state management. GetX is a lightweight, fast, and powerful state management library for Flutter.

### Shared Preferences 🔄

Shared preferences are used in this project for persisting user settings and data locally on the device.

### Login and Registration 🔒

The application includes functionality for user login and registration. All necessary validations are implemented to ensure data integrity.

### Email Verification 📧

Users are required to verify their email addresses upon registration. This ensures the security of user accounts and prevents unauthorized access.

### Password Reset 🔑

In case users forget their passwords, a password reset feature is provided. Users can initiate a password reset process, and instructions will be sent to their registered email addresses.

## Stripe Payment Gateway 💳

This project integrates Stripe for handling payments. Users can securely process payments within the app using Stripe's payment gateway. The implementation covers creating a payment intent, initializing the payment sheet, and presenting the payment sheet for the user to complete the transaction.

## Handling Data Fetching in GetX 📡

### Why Use GetX for Data Fetching?

GetX simplifies the state management process by providing reactive programming capabilities. This allows the application to automatically update the UI when data changes, eliminating the need for manual setState calls. It also includes built-in support for dependency injection and route management, making it a comprehensive solution for state management in Flutter.

### How to Handle Data Fetching in GetX

To handle data fetching in GetX, you need to create a controller that will manage the state of your data. The controller will fetch data from your data source (e.g., a remote API or a local database) and store it in reactive variables. These variables will then be observed by the UI, which will update automatically when the data changes.

### How GetX Helps in Data Fetching

- **Reactive State Management:** GetX makes it easy to manage state reactively, ensuring that the UI updates automatically when the data changes.
- **Simplicity:** With GetX, you can manage your state, dependencies, and routes with minimal boilerplate code.
- **Performance:** GetX is known for its performance and efficiency, as it only updates parts of the UI that need to be updated.
- **Dependency Injection:** GetX provides a simple and effective way to manage dependencies, making it easy to fetch and use data from various sources.



## Screenshots 📸

Here are some screenshots of the Fluom app:

- ![Fetch Data] <img width="1372" alt="Screenshot 2024-02-07 at 2 39 54 AM" src="https://github.com/Ankit-Dhattarwal/fluom_store/assets/109728587/9cbd01ee-e925-4f31-bdf4-b48ebf4313a5">

For more information on GetX and shared preferences, refer to the [online documentation](https://docs.getx.dev/) and [shared_preferences package](https://pub.dev/packages/shared_preferences), respectively.
