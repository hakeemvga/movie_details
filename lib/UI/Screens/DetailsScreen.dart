import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String image;
  final String tittle;
  final dynamic year;
  final String description;

  const DetailsScreen({
    Key? key,
    required this.description,
    required this.image,
    required this.tittle,
    required this.year,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: w,
            height: h / 2.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: w / 2,
                  child: Text(
                    widget.tittle.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text("Realed Year :${widget.year} "),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Description:\n${widget.description} ",
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
