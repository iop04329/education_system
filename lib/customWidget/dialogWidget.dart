import 'package:flutter/material.dart';

class customDialog {
  static Future<TimeOfDay?> showTimeDialog(BuildContext context, TimeOfDay time) async {
    final selectedTime = await showDialog(
      context: context,
      builder: ((context) {
        return CustomTimePicker(initialTime: time);
      }),
    );
    return selectedTime as TimeOfDay?;
  }
}

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final void Function(TimeOfDay time, int seconds)? onTimeChanged;

  const CustomTimePicker({
    Key? key,
    required this.initialTime,
    this.onTimeChanged,
  }) : super(key: key);

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int hours;
  late int minutes;
  late int seconds;

  @override
  void initState() {
    super.initState();
    hours = widget.initialTime.hour;
    minutes = widget.initialTime.minute;
    seconds = 0;
  }

  void _onTimeChanged() {
    if (widget.onTimeChanged != null) {
      widget.onTimeChanged!(TimeOfDay(hour: hours, minute: minutes), seconds);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('選擇時間'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('小時:'),
              Expanded(
                child: Slider(
                  value: hours.toDouble(),
                  min: 0,
                  max: 23,
                  divisions: 23,
                  label: '$hours',
                  onChanged: (value) {
                    setState(() {
                      hours = value.toInt();
                      _onTimeChanged();
                    });
                  },
                ),
              ),
              Text('$hours'),
            ],
          ),
          Row(
            children: [
              Text('分鐘:'),
              Expanded(
                child: Slider(
                  value: minutes.toDouble(),
                  min: 0,
                  max: 59,
                  divisions: 59,
                  label: '$minutes',
                  onChanged: (value) {
                    setState(() {
                      minutes = value.toInt();
                      _onTimeChanged();
                    });
                  },
                ),
              ),
              Text('$minutes'),
            ],
          ),
          Row(
            children: [
              Text('秒:'),
              Expanded(
                child: Slider(
                  value: seconds.toDouble(),
                  min: 0,
                  max: 59,
                  divisions: 59,
                  label: '$seconds',
                  onChanged: (value) {
                    setState(() {
                      seconds = value.toInt();
                      _onTimeChanged();
                    });
                  },
                ),
              ),
              Text('$seconds'),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('取消'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(TimeOfDay(hour: hours, minute: minutes));
          },
          child: Text('確定'),
        ),
      ],
    );
  }
}
