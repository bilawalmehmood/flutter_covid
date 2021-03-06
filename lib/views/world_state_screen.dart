import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_covid/models/world_status_model.dart';
import 'package:flutter_covid/services/status_services.dart';
import 'package:flutter_covid/views/countries_list.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    StatesServices statesServices = StatesServices();
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        FutureBuilder(
            future: statesServices.getWorldStatusRecord(),
            builder: (context, AsyncSnapshot<WorldStatusModel> snapshot) {
              if (!snapshot.hasData) {
                return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 40,
                      controller: _controller,
                    ));
              } else {
                return Column(
                  children: [
                    PieChart(
                      dataMap: {
                        "Total": double.parse(snapshot.data!.cases.toString()),
                        "Recoverd":
                            double.parse(snapshot.data!.recovered.toString()),
                        "Death": double.parse(snapshot.data!.deaths.toString()),
                      },
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left),
                      animationDuration: const Duration(microseconds: 1200),
                      chartType: ChartType.ring,
                      colorList: colorList,
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * .06),
                      child: Card(
                        child: Column(
                          children: [
                            ReusableRow(
                                title: "Total Cases",
                                value: snapshot.data!.cases.toString()),
                            ReusableRow(
                                title: "Recovered",
                                value: snapshot.data!.recovered.toString()),
                            ReusableRow(
                                title: "Death",
                                value: snapshot.data!.deaths.toString()),
                            ReusableRow(
                                title: "Critical",
                                value: snapshot.data!.critical.toString()),
                            ReusableRow(
                                title: "Tests",
                                value: snapshot.data!.tests.toString()),
                            ReusableRow(
                                title: "Active",
                                value: snapshot.data!.active.toString()),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountriesListScreen()));
                      },
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Text("Country Tracker")),
                      ),
                    ),
                  ],
                );
              }
            }),
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
