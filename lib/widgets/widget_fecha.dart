
import 'package:flutter/material.dart';

class DatePickerFormField extends StatelessWidget {
  const DatePickerFormField({super.key, required this.controllerText});

  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 200,
      child: TextFormField(
        controller: controllerText,
        style: const TextStyle(color: Color(0xFF808080)),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          final fecha_seledted = await _selectDate(context, controllerText);
          if (fecha_seledted != null) {
            controllerText.text = fecha_seledted;
          }
        },
      ),
    );
  }

  Future<String?> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1955),
      lastDate: DateTime(2101),
    );

    if (selected != null) {
      return "${selected.toLocal()}".split(' ')[0];
    } else {
      return null;
    }
  }
}
