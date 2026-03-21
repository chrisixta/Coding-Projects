import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_math_fork/flutter_math.dart'; // For LaTeX equation rendering

class ProbabilityCalculator extends StatefulWidget {
  const ProbabilityCalculator({super.key});

  @override
  _ProbabilityCalculatorState createState() => _ProbabilityCalculatorState();
}

class _ProbabilityCalculatorState extends State<ProbabilityCalculator> {
  double theta = 1.0;
  double xValue = 1.0;
  double result = 0.0; // Stores the computed f(x)
  List<FlSpot> graphPoints = [];

  @override
  void initState() {
    super.initState();
    updateGraph();
  }

  void updateGraph() {
    setState(() {
      graphPoints = generateGraph(theta, xValue);
      result = (1 / theta) * (exp(-xValue / theta)); // Calculate f(x) dynamically
    });
  }

  List<FlSpot> generateGraph(double theta, double x) {
    List<FlSpot> points = [];
    for (double i = 0; i <= x + 2; i += 0.5) {
      double y = (1 / theta) * (exp(-i / theta));
      points.add(FlSpot(i, y));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800], // Background is now LinkedIn Blue
      appBar: AppBar(
        title: const Text("Exponential Distribution", style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white, // Banner is now white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Equation Display in LaTeX
            Center(
              child: Math.tex(
                r"f(x) = \frac{1}{\theta} e^{-\frac{x}{\theta}}",
                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Theta Input
            Text("Theta (θ):", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter value for θ",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() {
                  theta = double.tryParse(value) ?? 1.0;
                  updateGraph();
                });
              },
            ),
            const SizedBox(height: 10),

            // X Input
            Text("X Value:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter value for x",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() {
                  xValue = double.tryParse(value) ?? 1.0;
                  updateGraph();
                });
              },
            ),
            const SizedBox(height: 20),

            // Computed f(x) Output
            Center(
              child: Text(
                "f($xValue) = ${result.toStringAsFixed(6)}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Graph
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: graphPoints,
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.blue[800],
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
