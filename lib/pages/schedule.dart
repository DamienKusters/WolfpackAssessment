import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/medicine.dart';
import 'package:wolfpack_assessment/models/moment.dart';
import 'package:wolfpack_assessment/widgets/moment_button.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({ Key? key }) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<MomentModel> moments = [
    MomentModel("Op 't werk", Image.asset("assets/business_center.png", color: Colors.white), DateTime.utc(2021,8,5,14,20),[MedicineModel("test")]),
    MomentModel("Lunch", Image.asset("assets/free_breakfast.png", color: Colors.white), DateTime.utc(2021,8,4,11,45),[MedicineModel("test")]),
    MomentModel("Half 4", Image.asset("assets/alarm.png", color: Colors.white), DateTime.utc(2021,8,6,15,30),[MedicineModel("test")]),
    MomentModel("Tijdens de klas", Image.asset("assets/class.png", color: Colors.white), DateTime.utc(2021,8,10,20,00),[MedicineModel("test")]),
    MomentModel("Thuis", Image.asset("assets/home.png", color: Colors.white), DateTime.utc(2021,8,4,12,00),[MedicineModel("test")]),
    MomentModel("Thuis", Image.asset("assets/home.png", color: Colors.white), DateTime.utc(2021,8,6,18,50),[MedicineModel("test")]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _renderMoments(),
    );
  }

  List<Widget> _renderMoments()
  {
    moments.sort((a,b) => a.date.isBefore(b.date) ? -1 : 1);

    DateTime lastDate = DateTime.utc(2000);
    List<Widget> output = [];
    for (var moment in moments)
    {
      if(lastDate.day < moment.date.day)
      {
        output.addAll([
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text("${moment.date.day}-${moment.date.month}-${moment.date.year}"),
          ),
          MomentButton(moment: moment),
        ]);
      }
      else
      {
        output.add(MomentButton(moment: moment));
      }

      lastDate = moment.date;
    }
    return output;
  }
}