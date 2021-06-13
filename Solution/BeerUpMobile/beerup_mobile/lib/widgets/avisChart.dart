import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class AvisChart extends StatelessWidget {
  final Avis avisMoyen;

  AvisChart({this.avisMoyen});
  @override
  Widget build(BuildContext context) {
    final List<double> _values = [
      avisMoyen.acidMoyen + 1,
      avisMoyen.amerMoyen + 1,
      avisMoyen.cafeMoyen + 1,
      avisMoyen.caraMoyen + 1,
      avisMoyen.fruitMoyen + 1,
      avisMoyen.houbMoyen + 1,
      avisMoyen.maltMoyen + 1,
      avisMoyen.sucrMoyen + 1
    ];
    final List<String> _labels = [
      'acidité',
      'amertume',
      'café',
      'caramel',
      'fruitée',
      'houblonnée',
      'maltée',
      'sucrée'
    ];

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
              maxWidth: 500,
              strokeColor: Colors.grey[200],
              labelColor: Colors.grey[200],
              values: _values,
              labels: _labels,
              maxValue: 6,
              fillColor: Colors.deepOrangeAccent[400],
            ),
          ),
        ],
      ),
    );
  }
}
