import 'package:flutter/material.dart';
import '../models/consultation.dart';



class ConsultationProvider with ChangeNotifier {
  final List<Consultation> _consultations = [];

  List<Consultation> get consultations => _consultations;

  void addConsultation(Consultation consultation) {
    _consultations.add(consultation);
    notifyListeners();
  }

  void deleteConsultation(int index) {
    _consultations.removeAt(index);
    notifyListeners();
  }
}
