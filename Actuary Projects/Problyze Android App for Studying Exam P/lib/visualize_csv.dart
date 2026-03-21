import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class VisualizeCsvPage extends StatefulWidget {
  const VisualizeCsvPage({super.key});

  @override
  State<VisualizeCsvPage> createState() => _VisualizeCsvPageState();
}

class _VisualizeCsvPageState extends State<VisualizeCsvPage> {
  List<List<dynamic>> csvData = [];
  String? chartUrl;
  String? error;

  Future<void> pickCsvFile() async {
    setState(() {
      error = null;
    });

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result == null) return;

    final file = File(result.files.single.path!);
    final content = await file.readAsString();

    try {
      final rows = const CsvToListConverter().convert(content);
      if (rows.isEmpty || rows[0].length < 2) {
        setState(() => error = "CSV must have at least 2 columns (X and Y)");
        return;
      }

      setState(() {
        csvData = rows;
        generateChart(rows);
      });
    } catch (e) {
      setState(() => error = "Invalid CSV format.");
    }
  }

  Future<void> generateChart(List<List<dynamic>> data) async {
    final labels = data.map((row) => row[0].toString()).toList();
    final values = data.map((row) => num.tryParse(row[1].toString()) ?? 0).toList();

    final chartConfig = {
      "type": "line",
      "data": {
        "labels": labels,
        "datasets": [
          {
            "label": "Uploaded Data",
            "data": values,
            "fill": false,
            "borderColor": "blue",
          }
        ]
      }
    };

    final response = await http.post(
      Uri.parse("https://quickchart.io/chart/create"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"chart": chartConfig}),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      setState(() {
        chartUrl = responseJson["url"];
      });
    } else {
      setState(() => error = "Failed to generate chart.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visualize Your CSV"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[800],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickCsvFile,
              child: const Text("Upload CSV File"),
            ),
            const SizedBox(height: 20),
            if (error != null)
              Text(error!, style: const TextStyle(color: Colors.red)),
            if (chartUrl != null)
              Expanded(
                child: Image.network(chartUrl!),
              ),
          ],
        ),
      ),
    );
  }
}
