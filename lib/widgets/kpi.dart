import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/moment.dart';

//THIS CLASS IS NOT USED
class Kpi extends StatelessWidget {
  final List<MomentModel> moments;

  const Kpi({ Key? key, required this.moments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              const Text("Medicines taken in the week of 22 November 2021", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),),
              const SizedBox(height: 5),
              Text(moments[0].isComplete().toString(), style: TextStyle(fontSize: 20, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}