import 'package:flutter/material.dart';
import 'package:flutter_assignment/job_location.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  var cities = [
    'Agra',
    'Ahmedabad',
    'Ahmednagar',
    'Ajmer',
    'Aligarh',
    'Amritsar',
    'Asansol',
    'Aurangabad',
    'Barelly',
    'Belagavi',
    'Bengaluru',
    'Bhavnagar',
    'Bilai'
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = cities;
    } else {
      results = cities
          .where((user) =>
              user.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      cities = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            "Select Job City",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: SizedBox(
          height: 20.0,
          width: 20.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 5.0,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                _runFilter(value);
              },
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobLocation(
                          city: cities[index],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(cities[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
