import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Image%20Picker/image_picker_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Image%20Picker/image_picker_events.dart';
import 'package:flutter_bloc_practice/BLoC/Image%20Picker/image_picker_states.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Image Picker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          builder: (context, state) {
            if (state.image == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: CircleAvatar(child: Icon(Icons.camera_alt_outlined)),
              );
            } else {
              return CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(File(state.image!.path.toString())),
                child: ElevatedButton(
                  onPressed: () {
                    print('Clear Image');
                    context.read<ImagePickerBloc>().add(ClearImage());
                    print('Cleared Image');
                    print(state.image!.path.toString());
                  },
                  child: Text('Clear Image'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
