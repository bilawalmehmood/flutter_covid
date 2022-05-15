import 'package:flutter/material.dart';
import 'package:flutter_covid/views/world_state_screen.dart';

class DetailCountry extends StatefulWidget {
  String? image, name;
  int? casses, recovered, deth, active, critical;

  DetailCountry(
      {Key? key,
      required this.image,
      required this.name,
      required this.casses,
      required this.recovered,
      required this.deth,
      required this.active,
      required this.critical})
      : super(key: key);

  @override
  State<DetailCountry> createState() => _DetailCountryState();
}

class _DetailCountryState extends State<DetailCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name.toString()),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09),
                  child: Card(
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                      ),
                      ReusableRow(
                          title: "Cases :", value: widget.casses.toString()),
                      ReusableRow(
                          title: "Recovered :",
                          value: widget.recovered.toString()),
                      ReusableRow(
                          title: "Deaths :", value: widget.deth.toString()),
                      ReusableRow(
                          title: "Active :", value: widget.active.toString()),
                      ReusableRow(
                          title: "Critical :",
                          value: widget.critical.toString()),
                    ]),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image.toString()),
                )
              ],
            ),
          ]),
    );
  }
}
