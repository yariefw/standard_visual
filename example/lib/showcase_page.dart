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
                  viewComponentButton(),
                  viewComponentInput(),
                  viewComponentDialog(),
                  viewComponentWindow(),
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

  Widget viewComponentButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Button', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text('Primary', style: TextStyle(fontSize: 14)),
          SizedBox(height: 15),
          ButtonPrimaryWidget(label: 'Label', isActive: true),
          SizedBox(height: 20),
          ButtonPrimaryWidget(label: 'Label', isActive: false),
          SizedBox(height: 20),
          Text('Secondary', style: TextStyle(fontSize: 14)),
          SizedBox(height: 15),
          ButtonSecondaryWidget(label: 'Label', isActive: true),
          SizedBox(height: 20),
          ButtonSecondaryWidget(label: 'Label', isActive: false),
          SizedBox(height: 20),
          Text('Extra', style: TextStyle(fontSize: 14)),
          SizedBox(height: 15),
          ButtonIconWidget(icon: Icon(Icons.settings), label: 'Icon Button'),
        ],
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

  Widget viewComponentWindow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Window', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          WindowFrameWidget(
            labelText: 'Label',
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: 36,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      'Content',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          WindowCardWidget(
            child: Text(
              'The quick brown fox jumps over the lazy dog. A wizard\'s job is to vex chumps quickly in fog. How vexingly quick daft zebras jump. The five boxing wizards jump quickly. Pack my box with five dozen liquor jugs. Sphinx of black quartz, judge my vow.',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
