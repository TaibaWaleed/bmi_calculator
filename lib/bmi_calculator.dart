import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController wtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inController = TextEditingController();
  String result = "";
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your BMI Calculator',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Circle avatar call
              _buildAvatar(),
              SizedBox(height: 16),

              ///build title
              _buildTitle(),
              SizedBox(height: 12),

              ///build text feild
              _buildTextField(
                  'Enter your weight in kg', Icons.line_weight, wtController),
              SizedBox(height: 12),
              _buildTextField(
                  'Enter your height in feet', Icons.height, ftController),
              SizedBox(height: 12),
              _buildTextField(
                  'Enter your height in inches', Icons.height, inController),
              SizedBox(height: 20),

              /// elevated button
              _buildCalculateButton(),
              SizedBox(height: 20),
              _buildResultText(),
            ],
          ),
        ),
      ),
    );
  }

  ///widget buildavatar
  Widget _buildAvatar() {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100,
        child: Image(
          image: NetworkImage(
            'https://www.pnbmetlife.com/content/dam/pnb-metlife/images/icons/bmi-calculator/meter.png',
          ),
        ),
      ),
    );
  }

  ///build title
  Widget _buildTitle() {
    return Text(
      'BMI Calculator',
      style: TextStyle(
        color: Colors.deepPurple,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ///text feild
  Widget _buildTextField(
      String labelText, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
      keyboardType: TextInputType.number,
    );
  }

  /// calculate button
  Widget _buildCalculateButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        minimumSize: Size(100, 40),
      ),
      onPressed: calculateBMI,
      child: Text('Calculate', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildResultText() {
    return Text(
      result,
      style: TextStyle(fontSize: 19),
    );
  }

  ///calculate
  void calculateBMI() {
    var wt = wtController.text.trim();
    var ft = ftController.text.trim();
    var inch = inController.text.trim();

    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
      var iWt = int.parse(wt);
      var iFt = int.parse(ft);
      var iInch = int.parse(inch);

      var tInch = (iFt * 12) + iInch;
      var tCm = tInch * 2.54;
      var tM = tCm / 100;

      var bmi = iWt / (tM * tM);

      var msg = "";

      if (bmi > 25) {
        msg = "You're Overweight!";
        bgColor = Colors.orange.shade100;
      } else if (bmi < 18) {
        msg = "You're Underweight!";
        bgColor = Colors.pink.shade100;
      } else {
        msg = " You're Healthy!";
        bgColor = Colors.green.shade100;
      }

      setState(() {
        result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "Please fill in all the required fields!";
      });
    }
  }
}
