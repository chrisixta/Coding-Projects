import 'package:flutter/material.dart';
import 'pdf_cdf.dart';
import 'pmf_cdf.dart';

class DistributionType extends StatelessWidget {
  const DistributionType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Distribution Type"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PdfCdf()),
                );
              },
              child: const Text("Continuous"),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PmfCdf()),
                );
              },
              child: const Text("Discrete"),
            ),
          ),
        ],
      ),
    );
  }
}
