import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double age = 0.0;
  
  var selectedYear;
  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

   _showPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2050)) 
        .then((DateTime dt) {
           setState(() {
        selectedYear = dt.year;
      });
   });
  }

  void calculatage() {
    setState(() {
      age = (2022 - selectedYear).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.red, child: const Text('Age Calculator')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: () {
                  _showPicker();
                },
                child: Text(selectedYear != null
                    ? selectedYear.toString()
                    : "Selecte year"),
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: const [
                //     Text('Pick Your Date'),
                //     Icon(Icons.calendar_month)
                //   ],
                // ),
              ),
            ),
            Text("Your age is ${age.toStringAsFixed(0)}"),
            
          ],
        ),
      ),
    );
  }
}
