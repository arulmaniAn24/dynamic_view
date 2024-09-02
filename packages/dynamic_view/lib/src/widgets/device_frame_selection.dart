import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDropdown extends StatefulWidget {
  const DeviceDropdown({super.key});

  @override
  DeviceDropdownState createState() => DeviceDropdownState();
}

class DeviceDropdownState extends State<DeviceDropdown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<DeviceOption>(
                      menuMaxHeight: 300,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      alignment: Alignment.bottomCenter,
                      isDense: true,
                      hint: const Text('Select Device'),
                      value: state.selectedDevice,
                      onChanged: (DeviceOption? newValue) {
                        if (newValue != null) {
                          context
                              .read<ViewBuilderBloc>()
                              .add(DeviceOptionEvent(device: newValue));
                        }
                      },
                      items: state.devices.map((DeviceOption device) {
                        return DropdownMenuItem<DeviceOption>(
                          value: device,
                          child: Text(
                            device.name,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 20),
                    CustomTextField(
                      controller: state.widthController,
                      labelText: 'Width',
                      readOnly: true,
                    ),
                    const SizedBox(width: 20),
                    CustomTextField(
                      controller: state.heightController,
                      labelText: 'Height',
                      readOnly: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DeviceSelector extends StatefulWidget {
  const DeviceSelector({super.key});

  @override
  DeviceSelectorState createState() => DeviceSelectorState();
}

class DeviceSelectorState extends State<DeviceSelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              color: const Color(0xFF1C336E),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.white)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.devices.length,
                  itemBuilder: (context, index) {
                    return _buildDeviceButton(
                        index,
                        _getDeviceIcon(state.devices[index].name),
                        state.devices[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Size(px)\n${state.width} x ${state.height}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getDeviceIcon(String deviceName) {
    if (deviceName.toLowerCase().contains("phone")) {
      return Icons.phone_android;
    } else if (deviceName.toLowerCase().contains("tablet")) {
      return Icons.tablet;
    } else {
      return Icons.desktop_windows;
    }
  }

  Widget _buildDeviceButton(int index, IconData icon, DeviceOption device) {
    return GestureDetector(
      onTap: () {
        context.read<ViewBuilderBloc>().add(
              DeviceOptionEvent(device: device),
            );
      },
      child: BlocBuilder<ViewBuilderBloc, ViewBuilderState>(
        builder: (context, state) {
          bool isSelected = state.selectedDevice!.name == device.name;

          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : const Color(0xFF1C336E),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Icon(
              icon,
              color: isSelected ? const Color(0xFF1C336E) : Colors.white,
            ),
          );
        },
      ),
    );
  }
}
