import 'dart:math';

import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';

class AvisChart extends StatelessWidget {
  final Avis avisMoyen;

  AvisChart({this.avisMoyen});
  @override
  Widget build(BuildContext context) {
    final List<double> _values = [
      avisMoyen.acidMoyen,
      avisMoyen.amerMoyen,
      avisMoyen.cafeMoyen,
      avisMoyen.caraMoyen,
      avisMoyen.fruitMoyen,
      avisMoyen.houbMoyen,
      avisMoyen.maltMoyen,
      avisMoyen.sucrMoyen
    ];
    final int _length = 8;

    return Container(
      child: Column(
        children: [
          Text(
            'AVIS DE LA COMMUNAUTE :',
            style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 2.0),
          ),
          SizedBox(height: 20),
          Center(
            child: RadarChart(
              length: _length,
              radius: 150,
              initialAngle: pi / 3,
              radialStroke: 2,
              radialColor: Colors.grey,
              radars: [
                RadarTile(
                  values: _values,
                  borderStroke: 2,
                  borderColor: Colors.orange,
                  backgroundColor: Colors.orange.withOpacity(0.4),
                  vertices: [],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
