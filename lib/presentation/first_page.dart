import 'dart:developer';

import 'package:bloc_example/bloc/text_controller_bloc.dart';
import 'package:bloc_example/presentation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SecondPage();
                },
              ));
            },
            icon: const Icon(Icons.home),
          ),
          TextButton(
              onPressed: () {
                log(context.read<TextControllerBloc>().controllerPG2.text);
              },
              child: const Text(
                "Hello",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
