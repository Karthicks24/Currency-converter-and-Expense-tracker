import 'package:currency_converter/pages/first_page.dart';
import 'package:flutter/material.dart';

class MaterialHomePage extends StatefulWidget{
  const MaterialHomePage({super.key});

  @override
  State <MaterialHomePage> createState() => _PrivateMaterialHomePage();
}

class _PrivateMaterialHomePage extends State<MaterialHomePage> {
  //Collecting value from Text Field
  TextEditingController textEditingController = TextEditingController();

  //Storing the result value in a variable to show in screen
  double result = 0;
  @override
  Widget build(BuildContext context){
    const border = OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Currency Converter",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Expense Tracker",style: TextStyle(
                color: Colors.white
              ),
              ),
              onTap: () {

                Navigator.pop(context);

                Navigator.pushNamed(context, '/firstpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings",style: TextStyle(
                color: Colors.white
              ),
              ),
              onTap: () {

                Navigator.pop(context);

                Navigator.pushNamed(context, '/secondpage');
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(result.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black
                ),
                decoration: const InputDecoration(
                  hintText: "Please Enter your Amount in USD",
                  hintStyle: TextStyle(
                    color: Colors.black87
                  ),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black87,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () { 
                //Updating the value to the result variable
                setState(() {
                  // print(double.parse(textEditingController.text)*81);
                  result = double.parse(textEditingController.text)*81;
                });
                // onPressed: () {
                //   // Updating the result
                //   setState(() {
                //     debugPrint(textEditingController.text);
                //     final input = textEditingController.text;
                //     if (input.isNotEmpty) {
                //       try {
                //         result = double.parse(input) * 81;
                //       } catch (e) {
                //         result = 0; // Reset result if invalid input
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(
                //             content: Text(
                //               "Invalid input! Please enter a numeric value.",
                //             ),
                //           ),
                //         );
                //       }
                //     }
                //   });
              }, style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.black),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                ),
              ),
               child: const Text("Convert",),
              ),
            ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExpenseTracker()));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.tealAccent,
            foregroundColor: Colors.black,
            minimumSize: const Size(40, 25)
          ),
          child: const Text("To First Page",))
          ],
        ),
      )
    );
  }
}