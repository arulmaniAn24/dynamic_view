import 'package:dynamic_view/dynamic_view_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomToolbar extends StatefulWidget {
  const CustomToolbar({super.key});

  @override
  State<CustomToolbar> createState() => _CustomToolbarState();
}

class _CustomToolbarState extends State<CustomToolbar> {
  late TextEditingController percentController;

  @override
  void initState() {
    super.initState();
    percentController = TextEditingController(text: "100");
  }

  @override
  void dispose() {
    percentController.dispose();
    super.dispose();
  }

  void _updatePercent(double change) {
    final currentPercent = double.tryParse(percentController.text) ?? 0;
    final newPercent = (currentPercent + change).clamp(0, 100);
    percentController.text = newPercent.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              const Gap(5),
              InkWell(
                onTap: () => setState(() => _updatePercent(-5)),
                child: const Icon(Icons.remove, size: 16.0),
              ),
              const Gap(5),
              Text('${percentController.text}%',
                  style: const TextStyle(fontSize: 12.0)),
              const Gap(5),
              InkWell(
                onTap: () => setState(() => _updatePercent(5)),
                child: const Icon(Icons.add, size: 16.0),
              ),
              const Gap(5),
            ],
          ),
        ),
        const Gap(12.0),
        InkWell(
          child: const Icon(Icons.undo, size: 16.0),
          onTap: () {},
        ),
        const Gap(4.0),
        InkWell(
          child: const Icon(Icons.redo, size: 16.0),
          onTap: () {},
        ),
        const Gap(12.0),
        InkWell(
          child: const Icon(Icons.restart_alt_sharp, size: 16.0),
          onTap: () => context.read<ViewBuilderBloc>().add(
                const ResetRightSideWidget(),
              ),
        ),
        const Gap(12.0),
        // InkWell(
        //   child: const Icon(Icons.copy, size: 16.0),
        //   onTap: () {},
        // ),
        // const Gap(12.0),
        // InkWell(
        //   child: const Icon(Icons.content_paste, size: 16.0),
        //   onTap: () {},
        // ),
        // const Gap(12.0),
        // InkWell(
        //   child: const Icon(Icons.delete, size: 16.0),
        //   onTap: () {},
        // ),
      ],
    );
  }
}
