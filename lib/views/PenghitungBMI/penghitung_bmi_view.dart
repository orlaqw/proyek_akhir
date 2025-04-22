import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/Sqflite_database/helper_penghitung_bmi.dart';
import 'package:projek_aplikasi_kesehatan/models/penghitung_bmi_model.dart';

class PenghitungBmiView extends StatefulWidget {
  const PenghitungBmiView({super.key});

  @override
  State<PenghitungBmiView> createState() => _PenghitungBmiViewState();
}

class _PenghitungBmiViewState extends State<PenghitungBmiView> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = "";
  String _bmiCategory = "";
  IconData _bmiIcon = Icons.help_outline;
  Color _bmiColor = Colors.black;
  List<PenghitungBmiModel> _bmiHistory = [];

  HelperPenghitungBmi dbHelper = HelperPenghitungBmi.instance;

  @override
  void initState() {
    super.initState();
    _loadBmiHistory();
  }

  Future<void> _loadBmiHistory() async {
    final data = await dbHelper.readAllBmi();
    setState(() {
      _bmiHistory = data;
      _bmiHistory.sort((a, b) => b.id!.compareTo(a.id!)); // Urutkan berdasarkan ID dalam urutan menurun
    });
  }

  void _calculateBMI() {
    final double height = double.parse(_heightController.text) / 100;
    final double weight = double.parse(_weightController.text);
    final double bmi = weight / (height * height);

    setState(() {
      _bmiResult = bmi.toStringAsFixed(2);
      if (bmi < 18.5) {
        _bmiCategory = "Underweight";
        _bmiIcon = Icons.sentiment_dissatisfied;
        _bmiColor = Colors.orange;
      } else if (bmi < 24.9) {
        _bmiCategory = "Normal";
        _bmiIcon = Icons.sentiment_satisfied;
        _bmiColor = Colors.green;
      } else {
        _bmiCategory = "Overweight";
        _bmiIcon = Icons.sentiment_very_dissatisfied;
        _bmiColor = Colors.red;
      }

      final newEntry = PenghitungBmiModel(
        result: _bmiResult,
        category: _bmiCategory,
        icon: _bmiIcon.codePoint,
        color: _bmiColor.value,
      );

      dbHelper.create(newEntry);
      _loadBmiHistory();
    });
  }

  void _removeHistoryItem(int index) {
    final id = _bmiHistory[index].id!;
    dbHelper.delete(id);
    _loadBmiHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 239, 129, 129), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/beranda');
                },
                child: Text(
                  "Back to home",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              foregroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/beranda');
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "What is your BMI?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20), // Kurangi margin top dari 50 menjadi 20
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Card(
                            margin: EdgeInsets.all(16.0),
                            color: Colors.white, // Set card color to white
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Your BMI",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    _bmiResult,
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(_bmiIcon, size: 32, color: _bmiColor),
                                      SizedBox(width: 10),
                                      Text(
                                        _bmiCategory,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: _bmiColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _heightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Input Height (cm)",
                                    prefixIcon: Icon(Icons.straighten, size: 35),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _weightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Input Weight (kg)",
                                    prefixIcon: Icon(Icons.monitor_weight, size: 45),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _calculateBMI,
                                  child: Text("Calculate BMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 239, 129, 129),
                                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50),
                          Column(
                            children: [
                              Text("History", style: TextStyle(fontSize: 20, color: Colors.grey)),
                              Divider(color: Colors.grey, thickness: 1, indent: 16, endIndent: 16),
                            ],
                          ),
                          _bmiHistory.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "No History Yet",
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                )
                              : Column(
                                  children: _bmiHistory.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    PenghitungBmiModel historyItem = entry.value;
                                    return Card(
                                      margin: EdgeInsets.all(16.0),
                                      color: Colors.white, // Set card color to white
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.grey, width: 1),
                                      ),
                                      child: ListTile(
                                        leading: Icon(IconData(historyItem.icon, fontFamily: 'MaterialIcons'), color: Color(historyItem.color)),
                                        title: Text("BMI: ${historyItem.result}"),
                                        subtitle: Text("Category: ${historyItem.category}"),
                                        trailing: IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () => _removeHistoryItem(index),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}