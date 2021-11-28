import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/moment.dart';
import 'package:wolfpack_assessment/services/moment_service.dart';
import 'package:wolfpack_assessment/widgets/moment_button.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({ Key? key }) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late List<MomentModel> moments;

  @override
  void initState() {
    super.initState();
    moments = MomentService().getMoments();
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.black12,
      child: ListView(
        children: _renderMoments(),
      ),
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