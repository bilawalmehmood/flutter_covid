import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        PieChart(
          dataMap: const {
            "Total": 20,
            "Recoverd": 50,
            "Death": 1,
          },
          chartRadius: MediaQuery.of(context).size.width / 3.2,
          legendOptions:
              const LegendOptions(legendPosition: LegendPosition.left),
          animationDuration: const Duration(microseconds: 1200),
          chartType: ChartType.ring,
          colorList: colorList,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .06),
          child: Card(
            child: Column(
              children: [
                ReusableRow(title: "Bilawal", value: "435"),
                ReusableRow(title: "Bilawal", value: "435"),
                ReusableRow(title: "Bilawal", value: "435")
              ],
            ),
          ),
        ),
        Container(
          height: 35,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: const Center(child: Text("Country Tracker")),
        ),
      ]),
    )));
  }
}

class ReusableRow extends StatelessWidget {
  String? title, value;

  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title!), Text(value!)],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}
