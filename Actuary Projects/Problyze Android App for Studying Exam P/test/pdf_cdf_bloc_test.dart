import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:problyze/bloc/pdf_cdf_bloc.dart'; // adjust if your folder is named differently

void main() {
  group('PdfCdfBloc', () {
    blocTest<PdfCdfBloc, PdfCdfState>(
      'emits [PdfCdfState.cdf] when SelectCdf is added',
      build: () => PdfCdfBloc(),
      act: (bloc) => bloc.add(SelectCdf()),
      expect: () => [PdfCdfState.cdf],
    );

    blocTest<PdfCdfBloc, PdfCdfState>(
      'emits [PdfCdfState.pdf] when SelectPdf is added',
      build: () => PdfCdfBloc(),
      act: (bloc) => bloc.add(SelectPdf()),
      expect: () => [PdfCdfState.pdf],
    );
  });
}
