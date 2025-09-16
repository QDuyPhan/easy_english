import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(body: Center(child: ShowBottomSheetExample())),
    );
  }
}

class ShowBottomSheetExample extends StatelessWidget {
  const ShowBottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showBottomSheet'),
        onPressed: () {
          Scaffold.of(context).showBottomSheet((BuildContext context) {
            return WheelPickerExample();
          });
        },
      ),
    );
  }
}

class WheelPickerExample extends StatefulWidget {
  const WheelPickerExample({super.key});

  @override
  State<WheelPickerExample> createState() => _WheelPickerExampleState();
}

class _WheelPickerExampleState extends State<WheelPickerExample> {
  final now = TimeOfDay.now();
  late final _hoursWheel = WheelPickerController(itemCount: 24, initialIndex: now.hour);
  late final _minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
    mounts: [_hoursWheel],
  );

  String selectedTime = "";

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 26.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      itemExtent: textStyle.fontSize! * textStyle.height!,
      // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    final timeWheels = <Widget>[
      for (final wheelController in [_hoursWheel, _minutesWheel])
        Expanded(
          child: WheelPicker(
            builder: itemBuilder,
            controller: wheelController,
            looping: wheelController == _minutesWheel,
            style: wheelStyle,
            selectedIndexColor: Colors.redAccent,
            // onIndexChanged: (index, interactionType) {
            //   _showSelectedTime();
            // },
          ),
        ),
    ];
    timeWheels.insert(1, const Text(":", style: textStyle));

    final amPmWheel = Expanded(
      child: WheelPicker(
        itemCount: 2,
        builder: (context, index) {
          return Text(["AM", "PM"][index], style: textStyle);
        },
        initialIndex: (now.period == DayPeriod.am) ? 0 : 1,
        looping: false,
        style: wheelStyle.copyWith(
          shiftAnimationStyle: const WheelShiftAnimationStyle(
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
          ),
        ),
      ),
    );

    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200.0,
              height: 200.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _centerBar(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(children: [...timeWheels, const SizedBox(width: 6.0)]),
                  ),
                ],
              ),
            ),
          ),
          Text('Select Time: $selectedTime'),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _showSelectedTime, child: Text('Print')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _hoursWheel.dispose();
    _minutesWheel.dispose();
    super.dispose();
  }

  void _showSelectedTime() {
    final hour = _hoursWheel.selected;
    final minute = _minutesWheel.selected;

    setState(() {
      selectedTime =
          "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
    });
  }

  Widget _centerBar(BuildContext context) {
    return Center(
      child: Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: const Color(0xFFC3C9FA).withAlpha(26),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

void showCustomBottomSheet({required BuildContext context, required Widget content}) {
  showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: null,
    maxHeight: 0.9,
    isSafeArea: true,

    anchors: [0, 0.4, 0.9],
    builder: (context, scrollController, bottomSheetOffset) {
      return Material(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
      );
    },
  );
}
