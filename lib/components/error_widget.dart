import 'package:flutter/material.dart';

//This shows up when there is an error while we fetch movies off the internet
class ErrorView extends StatelessWidget {
  final VoidCallback onTap;
  const ErrorView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_rounded,
            size: 28.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'An error occured please check your connection and try again.',
            textAlign: TextAlign.center,
          ),
          TextButton.icon(
            onPressed: onTap,
            label: const Text('Try again'),
            icon: const Icon(
              Icons.restart_alt_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
