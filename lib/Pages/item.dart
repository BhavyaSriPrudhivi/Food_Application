import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the DEBUG banner
      home: const MyApp(),
    ),
  );
}
class ItemPages extends StatefulWidget {
  const ItemPages({super.key});

  @override
  State<ItemPages> createState() => _ItemPagesState();
}

class _ItemPagesState extends State<ItemPages> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Butterfly Cake",
      "price": 400,
      "image": "assets/images/cake1.png",
    },
    {
      "name": "Chocolatetub Cake",
      "price": 450,
      "image": "assets/images/cake2.png",
    },
    {
      "name": "Strawberry Cake",
      "price": 350,
      "image": "assets/images/cake3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView & GridView"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // ListView Title
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "ListView",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ListView
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: Image.asset(
                        items[index]["image"],
                        width: 50,
                        height: 50,
                      ),
                      title: Text(items[index]["name"]),
                      subtitle: Text("₹${items[index]["price"]}"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ),

            const Divider(
              thickness: 3,
              color: Colors.white,
            ),

            // GridView Title
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "GridView",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // GridView
            Expanded(
              flex: 1,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: items.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            items[index]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          items[index]["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹${items[index]["price"]}",
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}