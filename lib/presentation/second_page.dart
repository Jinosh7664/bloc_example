import 'dart:developer';

import 'package:bloc_example/bloc/text_controller_bloc.dart';
import 'package:bloc_example/presentation/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const FirstPage();
                },
              ));
            },
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: context.read<TextControllerBloc>().controllerPG2,
            ),
            BlocBuilder<TextControllerBloc, TextControllerState>(
              builder: (context, state) {
                if (state is TextControllerUpdated) {
                  log("Address is ${state.address}");
                  return Text("Address is ${state.address}");
                } else if (state is TextControllerErased) {
                  return const Text("Address not Found in Memory");
                }
                log(state.toString());
                return Text(
                    context.read<TextControllerBloc>().controllerPG2.text);
              },
            ),
            TextButton(
                onPressed: () {
                  context.read<TextControllerBloc>().add(ClearText());
                },
                child: const Text("Clear Data")),
            TextButton(
                onPressed: () {
                  context.read<TextControllerBloc>().add(AddText());
                },
                child: const Text("Add Data"))
          ],
        ),
      ),
    );
  }
}
