import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/medicine.dart';
import 'package:wolfpack_assessment/models/moment.dart';

class MomentService
{
  List<MomentModel> getMoments()
  {
    return [
      MomentModel("Op 't werk", Image.asset("assets/business_center.png", color: Colors.white), DateTime.utc(2021,8,5,14,20),[
        MedicineModel("Simvastatine"),
        MedicineModel("Werk ze! pil"),
      ]),
      MomentModel("Lunch", Image.asset("assets/free_breakfast.png", color: Colors.white), DateTime.utc(2021,8,4,11,45),[
        MedicineModel("Lunchine"),
      ]),
      MomentModel("Half past three", Image.asset("assets/alarm.png", color: Colors.white), DateTime.utc(2021,8,6,15,30),[
        MedicineModel("Half past three pill (HPTP)"),
        MedicineModel("Simvastatine"),
      ]),
      MomentModel("Tijdens de klas", Image.asset("assets/class.png", color: Colors.white), DateTime.utc(2021,8,10,20,00),[
        MedicineModel("Smart-o-s"),
      ]),
      MomentModel("Thuis", Image.asset("assets/home.png", color: Colors.white), DateTime.utc(2021,8,4,12,00),[
        MedicineModel("Covid-19 pil"),
      ]),
      MomentModel("Thuis", Image.asset("assets/home.png", color: Colors.white), DateTime.utc(2021,8,6,18,50),[
        MedicineModel("Vitamines"),
      ]),
    ];
  }
}