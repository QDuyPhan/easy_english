import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../../core/utils/widgets/app_snack_bar.dart';
import '../../../../core/utils/widgets/request_notifications_permission_dialog.dart';
import '../../notifications/bloc/notifications_bloc.dart';

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

  void _scheduleNotifications() {
    final isGrantedNotificationsPermissionb = context
        .read<NotificationsBloc>()
        .state
        .isNotificationsGranted;
    if (!isGrantedNotificationsPermissionb) {
      showDialog(
        context: context,
        builder: (_) => const RequestNotificationsPermissionDialog(),
      );
      return;
    }
    final now = DateTime.now();
    final hour = _hoursWheel.selected;
    final minute = _minutesWheel.selected;
    final scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    ).add(const Duration(days: 1));

    // app_config.printLog(
    //   'i',
    //   'TimePicker: _scheduleNotifications scheduledDate: $scheduledDate',
    // );
    AppSnackBar.showSuccess(context, "Words reminder scheduled");
    Navigator.pop(context);
    context.read<NotificationsBloc>().add(
      NotificationsEvent.scheduleNextDayReminder(scheduledTime: scheduledDate),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: const Offset(0, -5),
          ),
        ],
      ),
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
                onTap: () => _scheduleNotifications(),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text('Xong')),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTimePicker(size, colorScheme: colorScheme),
        ],
      ),
    );
  }

  Widget _buildTimePicker(Size size, {ColorScheme? colorScheme}) {
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
              child: Row(
                children: [
                  ..._buildTimeWheels(colorScheme: colorScheme),
                  const SizedBox(width: 6.0),
                ],
              ),
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

  List<Widget> _buildTimeWheels({ColorScheme? colorScheme}) {
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
          selectedIndexColor: colorScheme!.primary,
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
          selectedIndexColor: colorScheme.primary,
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
