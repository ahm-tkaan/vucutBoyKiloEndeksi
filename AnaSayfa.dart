import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double _sonuc = 0;

  TextEditingController _boycontroller = TextEditingController();

  TextEditingController _kilocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Vücut Kitle Endeksi"),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_sonuc.toStringAsFixed(2),style: TextStyle(fontSize: 50),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _kilocontroller,
                decoration: InputDecoration(
                  suffixText: "KG",
                    label: Text("Kilonuz"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _boycontroller,
                decoration: InputDecoration(
                    label: Text("Boyunuz"),
                    suffixText: "cm",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),            ElevatedButton(
              style: ButtonStyle(elevation: MaterialStateProperty.resolveWith((states) => 10)),
                onPressed: hesapla,
                child: Text("Hesapla",
                style: TextStyle(
                  fontSize: 20,
                ),)
            )
          ],
        ),
      ),
    );

  }

void hesapla(){
    String boyText = _boycontroller.text.trim();
    String kiloText = _kilocontroller.text.trim();


    try{
      double boy =  double.parse(boyText);
      double kilo = double.parse(kiloText);
    setState(() {
      _sonuc= kilo/(boy*boy) ;

    });
    }catch(e){
      
      print("Bir Hata Oluştu = ${e.toString()}");
    }



}
}
