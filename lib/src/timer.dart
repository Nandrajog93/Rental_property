import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rental_property/src/calculation.dart';
class Countdown extends StatefulWidget {
  final DateTime expiration;
  final double? monthlyPrice;

  Countdown({required this.expiration, this.monthlyPrice, required double textSize});

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer _timer;
  late Duration _timeLeft;

  @override
  void initState() {
    super.initState();
    _timeLeft = _calculateTimeLeft(widget.expiration);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = _calculateTimeLeft(widget.expiration);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Duration _calculateTimeLeft(DateTime expiration) {
    final now = DateTime.now();
    final difference = expiration.difference(now);

    if (difference.isNegative) {
      return Duration.zero;
    }

    return difference;
  }

  String _formatTime(int time) {
    return time < 10 ? '0$time' : time.toString();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _timeLeft.inHours;
    final minutes = _timeLeft.inMinutes % 60;
    final seconds = _timeLeft.inSeconds % 60;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Scadenza: ${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
          style: TextStyle(fontSize: 12),
        ),
        if (widget.monthlyPrice != null)
          Text(
            'Prezzo mensile: \$${widget.monthlyPrice}',
            style: TextStyle(fontSize: 12),
          ),
      ],
    );
  }
}

