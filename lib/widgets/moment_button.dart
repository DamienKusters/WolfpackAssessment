import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/moment.dart';
import 'package:wolfpack_assessment/services/moment_service.dart';
import 'package:wolfpack_assessment/widgets/medicine_button.dart';

class MomentButton extends StatefulWidget {
  final MomentService momentService;
  final MomentModel moment;
  const MomentButton({ Key? key, required this.moment, required this.momentService }) : super(key: key);

  @override
  _MomentButtonState createState() => _MomentButtonState();
}

class _MomentButtonState extends State<MomentButton> {
  Image collapsedImage = Image.asset("assets/checkbox_empty.png");
  Image expandendImage = Image.asset("assets/checkbox_checked_white.png");

  late MomentModel moment;

  @override
  void initState() {
    super.initState();
    moment = widget.moment;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() {moment.isExpanded = !moment.isExpanded;}),
            child: Ink(
              height: 70,
              color: Colors.teal,
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: moment.iconImage
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(moment.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
                        Text("${moment.date.hour}:${moment.date.minute}", style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: moment.isComplete() ? expandendImage : collapsedImage
                  ),
                ],
              ),
            ),
          ),
          !moment.isExpanded ? Container() : _renderMedicines(),
        ],
      ),
    );
  }

  Widget _renderMedicines()
  {
    List<Widget> output = [];
    for (var medicine in moment.medicines) {
      output.add(MedicineButton(medicine: medicine, updateParent: () => _saveMoment(),));
    }
    return Column(children: output,);
  }

  void _saveMoment()
  {
    setState(() {});
    widget.momentService.saveMoment(moment);
  }
}