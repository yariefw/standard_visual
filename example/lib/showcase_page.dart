import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:standard_visual/standard_visual.dart';

part 'view_input_numpad.dart';

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  List<InputDropdownOption> inputDropdownOptions = [
    InputDropdownOption(value: 'Option 1'),
    InputDropdownOption(value: 'Option 2'),
  ];

  List<InputDropdownOption> dialogTypeOptions = [
    InputDropdownOption(value: 'Simple'),
    InputDropdownOption(value: 'Alert'),
  ];

  late InputDropdownOption dialogTypeSelected = dialogTypeOptions.first;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  viewComponentInput(),
                  viewComponentDialog(),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom + 150,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget viewComponentInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Input', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          InputTextWidget(
            labelText: 'Label',
            hintText: 'Hint',
            prefixText: 'Prefix',
          ),
          SizedBox(height: 20),
          InputDropdownWidget(
            labelText: 'Label',
            initialValue: inputDropdownOptions.first.value,
            options: inputDropdownOptions,
            onChanged: (selected) {},
          ),
          SizedBox(height: 20),
          InputCheckboxWidget(labelText: 'Label'),
          SizedBox(height: 20),
          InputSliderWidget(labelText: 'Label'),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewInputNumpadPage(),
                  ),
                );
              },
              child: Text('Input Numpad'),
            ),
          ),
        ],
      ),
    );
  }

  Widget viewComponentDialog() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dialog', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          InputDropdownWidget(
            labelText: 'Type',
            initialValue: dialogTypeSelected.value,
            options: dialogTypeOptions,
            onChanged: (selected) {
              dialogTypeSelected =
                  dialogTypeOptions.firstWhereOrNull(
                    (option) => option.value == selected,
                  ) ??
                  dialogTypeSelected;
            },
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String title = 'Title';
                    String message =
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

                    Widget child = Text('This is a widget. $message');

                    if (dialogTypeSelected == dialogTypeOptions[0]) {
                      return DialogSimple(
                        title: title,
                        children: [child],
                        onConfirm: () {},
                      );
                    }

                    if (dialogTypeSelected == dialogTypeOptions[1]) {
                      return DialogAlert(
                        title: title,
                        message: 'This is a string. $message',
                        onConfirm: () {},
                      );
                    }

                    return SizedBox.shrink();
                  },
                );
              },
              child: Text('Show Dialog'),
            ),
          ),
        ],
      ),
    );
  }
}
