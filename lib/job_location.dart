import 'package:flutter/material.dart';
import 'package:flutter_assignment/main.dart';

class JobLocation extends StatefulWidget {
  final String city;
  const JobLocation({Key? key, required this.city}) : super(key: key);

  @override
  State<JobLocation> createState() => _JobLocationState();
}

class _JobLocationState extends State<JobLocation> {
  var location = [
    '10th road',
    '16th road',
    '600 gate',
    'Tuljhabhavani chowk',
    'Akash Ganga Society',
    'Aarey Hospital',
    'Aarey Road Subway',
    'Abhinav School',
    'Adarsh Dairy',
  ];

  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cityController.text = widget.city;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _locationController.dispose();
    _cityController.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = location;
    } else {
      results = location
          .where((user) =>
              user.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      location = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            "Select Job Location",
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
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: "City",
                hintText: "City",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                _runFilter(value);
              },
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: "Enter Nearest Location",
                hintText: "Enter Nearest Location",
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
              itemCount: location.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          title: '',
                          city: widget.city,
                          location: location[index],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(location[index]),
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
