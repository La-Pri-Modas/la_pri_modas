import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("La Pri Modas")),
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 500,
              child: Image.asset("lib/presentation/ui/assets/images/logos/la_pri_modas_logo.png"),
            ),
            const Text(
              "Aguarde, você irá se surpreender !",
              style: TextStyle(color: Colors.black, fontSize: 26, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
