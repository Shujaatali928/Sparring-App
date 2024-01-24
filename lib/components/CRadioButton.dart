import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  LabeledRadio({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          CustomRadioButton(value: value, onChanged: onChanged),
          SizedBox(width: 8.0),
          Text(label),
        ],
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  CustomRadioButton({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: value ? Colors.blue : Colors.grey,
          ),
          color: value ? Colors.blue : Colors.white,
        ),
        child: value
            ? Center(
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
