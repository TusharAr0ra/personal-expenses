import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  const ChartBar(
      this.label, this.spendingAmount, this.spendingPercentageOfTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,
            constraints) //it will dynamically calculate the height and width of the widgets inside of it.(using constraints.maxHeight)
        {
      return Column(
        children: [
          SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(height: constraints.maxHeight * 0.05),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1.0),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    FractionallySizedBox(
                        heightFactor: spendingPercentageOfTotal,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ))
                  ],
                )),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          SizedBox(height: constraints.maxHeight * 0.15, child: Text(label)),
        ],
      );
    });
  }
}
