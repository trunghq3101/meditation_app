import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:meditation_app/utils/theme.dart';

const daysOfWeek = ["SU", "M", "T", "W", "TH", "F", "S"];

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Spacer(),
            Expanded(
              flex: 2,
              child: _Title(
                title: 'What time would you\nlike to meditate?',
                subtitle:
                    'Any time you can choose but we recommend\nfirst thing in the morning.',
              ),
            ),
            Expanded(
              flex: 3,
              child: _TimeSelect(),
            ),
            Expanded(
              flex: 2,
              child: _Title(
                title: 'Which day would you\nlike to meditate?',
                subtitle:
                    'Everyday is best, but we recommend \npicking at least five.',
              ),
            ),
            Expanded(
              child: _DaySelect(),
            ),
            Expanded(
              flex: 2,
              child: _Buttons(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSelect extends StatelessWidget {
  const _TimeSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 24),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                const Offset(0, 0),
                Offset(0, bounds.height),
                [
                  const Color(0x26F5F5F9),
                  const Color.fromARGB(111, 245, 245, 249),
                  const Color(0xFFF5F5F9),
                  const Color(0xFFF5F5F9),
                  const Color.fromARGB(111, 245, 245, 249),
                  const Color(0x26F5F5F9),
                ],
                [0, 0.2, 0.3, 0.7, 0.8, 1],
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Expanded(
                  child: _TimeWheel(
                    itemText: (index) => '${index % 12 + 1}',
                  ),
                ),
                Expanded(
                  child: _TimeWheel(
                    itemText: (index) => '${index % 60}',
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ListWheelScrollView(
                      itemExtent: constraints.maxHeight * 0.2,
                      squeeze: 0.8,
                      diameterRatio: 1.4,
                      overAndUnderCenterOpacity: 0.5,
                      children: [
                        FittedBox(
                            child: Text('AM', style: PrimaryFont.medium(24))),
                        FittedBox(
                            child: Text('PM', style: PrimaryFont.medium(24))),
                      ],
                    );
                  }),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Align(
            alignment: Alignment(0, -0.3),
            child: Divider(
              color: Color(0xFFE1E1E5),
            ),
          ),
          const Align(
            alignment: Alignment(0, 0.2),
            child: Divider(
              color: Color(0xFFE1E1E5),
            ),
          )
        ],
      ),
    );
  }
}

class _TimeWheel extends StatelessWidget {
  const _TimeWheel({
    Key? key,
    required this.itemText,
  }) : super(key: key);

  final String Function(int index) itemText;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ListWheelScrollView.useDelegate(
        itemExtent: constraints.maxHeight * 0.2,
        squeeze: 0.8,
        diameterRatio: 1.4,
        overAndUnderCenterOpacity: 0.5,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return FittedBox(
              child: Text(
                itemText(index),
                style: PrimaryFont.medium(24),
              ),
            );
          },
        ),
      );
    });
  }
}

class _DaySelect extends StatelessWidget {
  const _DaySelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: const Color(0xFFA1A4B2),
                  ),
                ),
                child: Center(
                  child: FittedBox(child: Text(daysOfWeek[index])),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'SAVE',
                style: PrimaryFont.medium(14),
              ),
              textColor: Colors.white,
              color: kColorPrimary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'NO THANKS',
                style: PrimaryFont.medium(14).copyWith(color: kColorDarkGrey),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              alignment: Alignment.topLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: PrimaryFont.bold(24).copyWith(height: 1.35),
                ),
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  subtitle,
                  style: PrimaryFont.light(16).copyWith(
                    color: const Color(0xFFA1A4B2),
                    height: 1.65,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
