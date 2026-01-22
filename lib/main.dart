import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/counter/counter_bloc.dart';
import 'package:test/bloc/image_picker/image_picker_bloc.dart';
import 'package:test/bloc/image_picker/utils/image_picker_utils.dart';
import 'package:test/bloc/slider/slider_bloc.dart';
import 'package:test/bloc/todo/todo_bloc.dart';
import 'package:test/bloc/toggle/toggle_bloc.dart';
import 'package:test/screen/bloc_learn_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ToggleBloc()),
        BlocProvider(create: (context) => SliderBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(theme: ThemeData.dark(), home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Build the homepage');

    return Scaffold(
      appBar: AppBar(title: Text('Hello world 2')),
      body: BlocLearnScreen(),
    );
  }
}
