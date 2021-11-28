import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/moment.dart';
import 'package:wolfpack_assessment/services/moment_service.dart';

class OverviewPage extends StatefulWidget {
  final MomentService momentService;
  const OverviewPage({ Key? key, required this.momentService }) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late List<MomentModel> moments;

  @override
  Widget build(BuildContext context) {
    moments = widget.momentService.getMoments();
    return Container(
      color: Colors.black12,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text("Week of 22 November 2021", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),),
                    const SizedBox(height: 5),
                    Text("${widget.momentService.getAmountOfTakenMedicines(moments)} out of ${widget.momentService.getTotalMedicines(moments)} medicines taken", style: TextStyle(fontSize: 20, color: Colors.white),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}