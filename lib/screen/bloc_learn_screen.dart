import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/counter/counter_bloc.dart';
import 'package:test/bloc/counter/counter_event.dart';
import 'package:test/bloc/counter/counter_state.dart';
import 'package:test/bloc/image_picker/image_picker_bloc.dart';
import 'package:test/bloc/image_picker/image_picker_event.dart';
import 'package:test/bloc/image_picker/image_picker_state.dart';
import 'package:test/bloc/slider/slider_bloc.dart';
import 'package:test/bloc/slider/slider_event.dart';
import 'package:test/bloc/slider/slider_state.dart';
import 'package:test/bloc/toggle/toggle_bloc.dart';
import 'package:test/bloc/toggle/toggle_event.dart';
import 'package:test/bloc/toggle/toggle_state.dart';

class BlocLearnScreen extends StatefulWidget {
  const BlocLearnScreen({super.key});

  @override
  State<BlocLearnScreen> createState() => _BlocLearnScreenState();
}

class _BlocLearnScreenState extends State<BlocLearnScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build whole counter screen');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                debugPrint('build this number UI');
                return Center(
                  child: Text(
                    state.count.toString(),
                    style: TextStyle(fontSize: 200),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // increment event triggering
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: Text("Increment"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // decrement event triggering
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: Text("decrement"),
                ),
                SizedBox(height: 10),
              ],
            ),
            Text('This one has the independent bloc uses toggle bloc'),
            // from the flutter official docs: https://docs.flutter.dev/ui/widgets/material
            BlocBuilder<ToggleBloc, ToggleState>(
              builder: (context, state) {
                debugPrint(
                  'rebuild this switch button with ${state.isFavorited}',
                );
                return Switch(
                  value: state.isFavorited,
                  onChanged: (bool value) {
                    context.read<ToggleBloc>().add(ToggleButtonEvent());
                  },
                );
              },
            ),

            BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                debugPrint('Building slider and Container');
                return Column(
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      color: Colors.red.withValues(alpha: state.sliderValue),
                    ),
                    Slider(
                      value: state.sliderValue,
                      onChanged: (value) {
                        context.read<SliderBloc>().add(
                          SlideEvent(newValue: value),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Container(child: Text("Below is the image picker")),
            SizedBox(height: 10),
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                debugPrint("Building the image picker");
                return Center(
                  child: Column(
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () {
                            context.read<ImagePickerBloc>().add(
                              CameraCapture(),
                            );
                          },
                          icon: Icon(Icons.camera),
                        ),
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            context.read<ImagePickerBloc>().add(
                              ImagePickerFromGalley(),
                            );
                          },
                          icon: Icon(Icons.browse_gallery),
                        ),
                      ),
                      state.imgFile == null
                          ? Container(child: Text('No Image found'))
                          : Image.file(File(state.imgFile!.path)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
