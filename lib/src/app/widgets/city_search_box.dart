import 'package:flutter/material.dart';
import 'package:marta_technical_test/src/app/constants/constants.dart';
import 'package:marta_technical_test/src/app/pages/home/home_controller.dart';

class CitySearch extends StatelessWidget {
  CitySearch({required this.homeController});

  final HomeController homeController;
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: w * 0.1,
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: searchCity,
                ),
                onSubmitted: (value) => value,
              ),
            ),
          ),
          InkWell(
            child: Container(
                width: 75,
                alignment: Alignment.center,
                child: Icon(
                  Icons.search,
                  color: Colors.grey[800],
                )),
            onTap: () {
              this.homeController.searchCity(_searchController.text);
            },
          )
        ],
      ),
    );
  }
}
