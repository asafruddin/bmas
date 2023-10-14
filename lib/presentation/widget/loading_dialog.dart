import 'package:flutter/material.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8.0),
              Text(message ?? 'Loading')
            ],
          ),
        ),
      ),
    );
  }
}
