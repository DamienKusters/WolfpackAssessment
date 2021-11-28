import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/medicine.dart';

class MedicineButton extends StatefulWidget {
  final MedicineModel medicine;
  final Function updateParent;
  const MedicineButton({ Key? key, required this.medicine, required this.updateParent, }) : super(key: key);

  @override
  _MedicineButtonState createState() => _MedicineButtonState();
}

class _MedicineButtonState extends State<MedicineButton> {
  Image collapsedImage = Image.asset("assets/checkbox_empty.png");
  Image expandendImage = Image.asset("assets/checkbox_checked_green.png");

  late MedicineModel medicine;

  @override
  void initState() {
    super.initState();
    medicine = widget.medicine;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() { medicine.taken = !medicine.taken; widget.updateParent(); }),
      child: Ink(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.lime, width: 5)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(medicine.name),
                  Text("2 stuks, 40 mg"),
                ],
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              height: 30,
              width: 50,
              child: medicine.taken ? expandendImage : collapsedImage
            ),
          ],
        ),
      ),      
    );
  }
}