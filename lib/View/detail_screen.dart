import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name, image;
  int totalcase, totalrecovered, totaldeath, critical, active, recovered;
  DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalcase,
    required this.totalrecovered,
    required this.totaldeath,
    required this.critical,
    required this.active,
    required this.recovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReuseableRow(
                          title: 'Total Cases',
                          value: widget.totalcase.toString()),
                      ReuseableRow(
                          title: 'Recovered',
                          value: widget.recovered.toString()),
                      ReuseableRow(
                          title: 'Active', value: widget.active.toString()),
                      ReuseableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReuseableRow(
                          title: 'Total Death',
                          value: widget.totaldeath.toString()),
                      ReuseableRow(
                          title: 'Total Rocovered',
                          value: widget.totalrecovered.toString()),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}
