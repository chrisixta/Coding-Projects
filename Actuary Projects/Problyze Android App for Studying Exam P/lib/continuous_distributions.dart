import 'package:flutter/material.dart';
import 'calculator.dart'; // For Exponential — others to be added later

class ContinuousDistributionsPage extends StatelessWidget {
  const ContinuousDistributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final distributions = [
      'Continuous Uniform',
      'Exponential',
      'Weibull',
      'Gamma',
      'Normal',
      'Lognormal',
      'Beta',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Distribution"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: distributions.map((distribution) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (distribution == 'Exponential') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProbabilityCalculator()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$distribution PDF calculator coming soon!")),
                      );
                    }
                  },
                  child: Text(distribution),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
