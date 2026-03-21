import 'package:flutter/material.dart';
// TODO: Import calculators as you create them (e.g., binomial_calculator.dart)

class DiscreteDistributionsPage extends StatelessWidget {
  const DiscreteDistributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final distributions = [
      'Discrete Uniform',
      'Binomial',
      'Hypergeometric',
      'Geometric',
      'Negative Binomial',
      'Poisson',
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
                    // TEMP: Show message until calculator pages are added
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$distribution PMF calculator coming soon!")),
                    );
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
