import 'package:flutter/material.dart';

const List<String> horarioManha = <String>['08:30', '09:00', '09:30', '10:00', '10:30', '11:00', '11:30'];


class Consultas extends StatefulWidget{
  const Consultas ({super.key});

  @override
  ConsultasState createState() {
    return ConsultasState();
  }
}

class ConsultasState extends State<Consultas> {
  String dropdownValue = horarioManha.first;

  @override
  Widget build(BuildContext context){
    
    return  DropdownMenu<String>(
      
      menuHeight: 300,

      initialSelection: horarioManha.first,
      onSelected: (String? value) {
        
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: horarioManha.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }


}