import 'package:flutter/material.dart';
import 'distribution_type.dart';

class ExamSelection extends StatelessWidget {
  const ExamSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Exam'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DistributionType(),
              ),
            );
          },
          child: const Text('Exam P'),
        ),
      ),
    );
  }
}

