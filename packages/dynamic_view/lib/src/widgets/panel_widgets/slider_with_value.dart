import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderWithValue extends StatefulWidget {
  const SliderWithValue({super.key, required this.properties});
  final Map<String, dynamic> properties;
  @override
  SliderWithValueState createState() => SliderWithValueState();
}

class SliderWithValueState extends State<SliderWithValue> {
  double _sliderValue = 14.0;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> tempProperties = widget.properties;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
              tempProperties['paddingDx'] = value ?? 14.0;
              tempProperties['paddingDy'] = value ?? 14.0;
              context.read<ViewBuilderBloc>().add(
                  ChangePropertiesSelectedWidgetEvent(
                      changedProperties: tempProperties));
            },
            activeColor: Colors.white,
            inactiveColor: Colors.grey[400],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            _sliderValue.toInt().toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
