import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  static snackbar(String title, String message) {
    Get.snackbar(
      '', 
      '',
      backgroundColor: Colors.blue[600],
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      duration: const Duration(seconds: 2),
      icon: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(Icons.info, color: Colors.white),
      ),
      messageText: Row(
        children: [
          // Logo or icon on the left
          const CircleAvatar(
            backgroundImage:
                AssetImage("assets/images/logo.png"), // Replace with your asset path
            radius: 20,
          ),
          const SizedBox(width: 10),

          // Text content in columns
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}