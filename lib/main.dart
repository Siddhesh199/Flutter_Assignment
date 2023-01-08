import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/category_screen.dart';
import 'package:flutter_assignment/select_city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        city: '',
        location: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.city,
      required this.location});

  final String title;
  final String city;
  final String location;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _jobCityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dobController.text = selectedDate.toString().substring(0, 11);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _jobCityController.dispose();
    _locationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.city != '') {
      _jobCityController.text = widget.city;
    }
    if (widget.location != '') {
      _locationController.text = widget.location;
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                height: 30.0,
                width: 30.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Center(
                child: Text(
                  'Let\' create your',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 200.0,
              ),
              Form(
                key: _signUpFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _fullNameController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          labelText: 'Full Name',
                          // hintText: hintText,
                          // labelText: labelText,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onTap: () => _selectDate(context),
                        keyboardType: TextInputType.none,
                        controller: _dobController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.green,
                          ),
                          labelText: 'Date of Birth',
                          // hintText: hintText,
                          // labelText: labelText,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      DropdownSearch<String>(
                        popupProps: const PopupProps.menu(
                          showSelectedItems: true,
                        ),
                        items: const ["Male", "Female"],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.green,
                            ),
                            labelText: 'Gender',
                            // hintText: hintText,
                            // labelText: labelText,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                        onChanged: print,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectCity(),
                            ),
                          );
                        },
                        keyboardType: TextInputType.none,
                        controller: _jobCityController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.green,
                          ),
                          labelText: 'Job City',
                          // hintText: hintText,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      _locationController.text != ''
                          ? TextFormField(
                              keyboardType: TextInputType.none,
                              controller: _locationController,
                              decoration: const InputDecoration(
                                labelText: 'Location',
                                // hintText: hintText,
                                // labelText: labelText,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black38,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 50.0,
                            ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryScreen(),
                              ),
                            );
                          }
                        },
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
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
