import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/medicine.dart';
import 'package:wolfpack_assessment/models/moment.dart';

class MomentService
{
  final List<MomentModel> _momentModels = [
    MomentModel("Op 't werk", Image.asset("assets/business_center.png", color: Colors.white), DateTime.utc(2021,11,23,14,20),[
      MedicineModel("Simvastatine"),
      MedicineModel("Werk ze! pil"),
    ]),
    MomentModel("Lunch", Image.asset("assets/free_breakfast.png", color: Colors.white), DateTime.utc(2021,11,22,11,45),[
      MedicineModel("Lunchine"),
      MedicineModel("Simvastatine"),
    ]),
    MomentModel("Half past three", Image.asset("assets/alarm.png", color: Colors.white), DateTime.utc(2021,11,24,15,30),[
      MedicineModel("Half past three pill (HPTP)"),
      MedicineModel("Simvastatine"),
    ]),
    MomentModel("Tijdens de klas", Image.asset("assets/class.png", color: Colors.white), DateTime.utc(2021,11,26,20,00),[
      MedicineModel("Smart-o-s"),
    ]),
    MomentModel("Thuis", Image.asset("assets/home.png", color: Colors.white), DateTime.utc(2021,11,22,12,00),[
      MedicineModel("Covid-19 pil"),
    ]),
    MomentModel("Thuis", Image.asset("assets/home.png", color: Colors.white), DateTime.utc(2021,11,24,18,50),[
      MedicineModel("Vitamines"),
    ]),
  ];

  List<MomentModel> getMoments()
  {
    return _momentModels;
  }

  void saveMoment(MomentModel model)
  {
    _momentModels[_momentModels.indexOf(model)] = model;
  }

  int getTotalMedicines(List<MomentModel> models)
  {
    int amount = 0;
    models.forEach((m) => amount += m.medicines.length);
    return amount;
  }

  int getAmountOfTakenMedicines(List<MomentModel> models)
  {
    int amount = 0;
    models.forEach((m) => amount += m.getAmountOfTakenMedicines());
    return amount;
  }
}