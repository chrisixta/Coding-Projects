import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pdf_cdf_bloc.dart';
import 'exam_selection.dart'; // Fix: start at exam selection

void main() {
  runApp(
    BlocProvider(
      create: (_) => PdfCdfBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Problyze',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExamSelection(), // ✅ NOW STARTS AT EXAM SELECTION
    );
  }
}
