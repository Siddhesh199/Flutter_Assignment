import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, dynamic>> _allCategories = [
    {"logo": const Icon(Icons.abc), "name": 'Business development'},
    {"logo": const Icon(Icons.ac_unit), "name": 'BPO'},
    {"logo": const Icon(Icons.access_alarm), "name": 'Graphic Designer'},
    {"logo": const Icon(Icons.back_hand), "name": 'Technology'},
    {"logo": const Icon(Icons.cabin), "name": 'Teacher'},
    {"logo": const Icon(Icons.dangerous), "name": 'Student'},
    {"logo": const Icon(Icons.e_mobiledata), "name": 'Engineer'},
    {"logo": const Icon(Icons.face), "name": 'Doctor'},
  ];

  List<Map<String, dynamic>> _foundCategories = [];

  final TextEditingController _searchController = TextEditingController();

  List selectedList = [];

  bool isChecked = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  initState() {
    _foundCategories = _allCategories;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allCategories;
    } else {
      results = _allCategories
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35.0,
              ),
              // selectedList.isEmpty
              //     ?
              Column(
                children: const [
                  Center(
                    child: Text(
                      'Let\'s start by selecting',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Your Area of interest',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ),
                ],
              ),
              // : ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: selectedList.length,
              //   itemBuilder: (context, index) {
              //     return GestureDetector(
              //       child: CircleAvatar(
              //         child: selectedList[index]["logo"],
              //         radius: 10.0,
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(
                height: 30.0,
              ),
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: 1020.0,
                  // color: Colors.blue,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        'Choose Your Category',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        'You have to choose atleast one category',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: _allCategories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                              if (isChecked) {
                                selectedList.add(index);
                              } else {
                                selectedList.remove(index);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 5.0,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: selectedList.contains(index)
                                            ? Colors.green
                                            : Colors.black,
                                      )
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 50.0,
                                    child: _allCategories[index]["logo"],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(_allCategories[index]["name"]),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          backgroundColor: Colors.green,
                          minimumSize: const Size(double.infinity, 50.0),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
