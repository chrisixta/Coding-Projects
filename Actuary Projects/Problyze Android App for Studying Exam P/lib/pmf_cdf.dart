import 'package:flutter/material.dart';
import 'discrete_distributions.dart'; // You’ll create this next

class PmfCdf extends StatelessWidget {
  const PmfCdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose PMF or CDF")),
      backgroundColor: Colors.blue[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DiscreteDistributionsPage()),
                );
              },
              child: const Text("PMF"),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add CDF navigation here when ready
              },
              child: const Text("CDF"),
            ),
          ),
        ],
      ),
    );
  }
}
