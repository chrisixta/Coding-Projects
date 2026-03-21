import 'package:flutter_bloc/flutter_bloc.dart';

// EVENTS
abstract class PdfCdfEvent {}

class SelectPdf extends PdfCdfEvent {}

class SelectCdf extends PdfCdfEvent {}

// STATES
enum PdfCdfState { pdf, cdf }

// BLOC
class PdfCdfBloc extends Bloc<PdfCdfEvent, PdfCdfState> {
  PdfCdfBloc() : super(PdfCdfState.pdf) {
    on<SelectPdf>((event, emit) => emit(PdfCdfState.pdf));
    on<SelectCdf>((event, emit) => emit(PdfCdfState.cdf));
  }
}

