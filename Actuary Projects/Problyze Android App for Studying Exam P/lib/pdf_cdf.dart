import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pdf_cdf_bloc.dart';
import 'visualize_csv.dart';
import 'continuous_distributions.dart';

class PdfCdf extends StatelessWidget {
  const PdfCdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: const Text("Choose PDF or CDF"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<PdfCdfBloc>().add(SelectPdf());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ContinuousDistributionsPage(),
                  ),
                );
              },
              child: const Text("PDF"),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<PdfCdfBloc>().add(SelectCdf());
                // TODO: Add your real CDF navigation
              },
              child: const Text("CDF"),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VisualizeCsvPage()),
                );
              },
              child: const Text("📈 Visualize CSV"),
            ),
          ),
        ],
      ),
    );
  }
}
