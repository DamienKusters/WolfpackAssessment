import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/medicine.dart';

class MomentModel
{
  String title;
  Image iconImage;
  DateTime date;
  List<MedicineModel> medicines;
  bool isExpanded;
  bool isComplete() => medicines.every((m) => m.taken == true);
  int getAmountOfTakenMedicines() => medicines.where((m) => m.taken == true).length;

  MomentModel(this.title, this.iconImage, this.date, this.medicines, {this.isExpanded = false});
}