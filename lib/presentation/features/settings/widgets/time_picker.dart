import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class TimePicker extends StatefulWidget {
  final VoidCallback? onTap;
  final Function(int, WheelPickerInteractionType)? onIndexChanged;

  const TimePicker({super.key, this.onTap, this.onIndexChanged});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final now = TimeOfDay.now();

  late final _hoursWheel = WheelPickerController(itemCount: 24, initialIndex: now.hour);

  late final _minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
    mounts: [_hoursWheel],
  );

  String selectedTime = "";

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: Colors.grey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text('Hủy')),
              ),
              GestureDetector(
                onTap: null,
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text('Xong')),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTimePicker(size),
        ],
      ),
    );
  }

  Widget _buildTimePicker(Size size) {
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.height * 0.3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildCenterBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(children: [..._buildTimeWheels(), const SizedBox(width: 6.0)]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterBar() {
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

  List<Widget> _buildTimeWheels() {
    const textStyle = TextStyle(fontSize: 26.0, height: 1.5);

    final wheelStyle = WheelPickerStyle(
      itemExtent: textStyle.fontSize! * textStyle.height!,
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text(index.toString().padLeft(2, '0'), style: textStyle);
    }

    final wheels = <Widget>[
      Expanded(
        child: WheelPicker(
          builder: itemBuilder,
          controller: _hoursWheel,
          style: wheelStyle,
          selectedIndexColor: Colors.redAccent,
          onIndexChanged: widget.onIndexChanged,
        ),
      ),
      const Text(":", style: textStyle),
      Expanded(
        child: WheelPicker(
          builder: itemBuilder,
          controller: _minutesWheel,
          looping: true,
          style: wheelStyle,
          selectedIndexColor: Colors.redAccent,
          onIndexChanged: widget.onIndexChanged,
        ),
      ),
    ];

    return wheels;
  }

  Widget _buildAmPmWheel() {
    const textStyle = TextStyle(fontSize: 26.0, height: 1.5);

    return Expanded(
      child: WheelPicker(
        itemCount: 2,
        builder: (context, index) => Text(["AM", "PM"][index], style: textStyle),
        initialIndex: (now.period == DayPeriod.am) ? 0 : 1,
        looping: false,
        style: WheelPickerStyle(
          itemExtent: textStyle.fontSize! * textStyle.height!,
          shiftAnimationStyle: const WheelShiftAnimationStyle(
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
          ),
        ),
      ),
    );
  }
}
