import 'package:coffeappui/util/coffe_tile.dart';
import 'package:coffeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelected ]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(
      () {
        for (int i = 0; i < coffeeType.length; i++) {
          coffeeType[i][1] = false;
        }
        coffeeType[index][1] = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(children: [
        // Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),

        const SizedBox(
          height: 25,
        ),
        //Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Find your coffee...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        //horizontal listview of coffee types
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context, index) {
              return CoffeeType(
                coffeeType: coffeeType[index][0],
                isSelected: coffeeType[index][1],
                onTap: () {
                  coffeeTypeSelected(index);
                },
              );
            },
          ),
        ),

        //horizontal listview of coffee tiles
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/images/latte.png',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/cappucino.png',
                coffeeName: 'Cappucino',
                coffeePrice: '4.35',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/milk.png',
                coffeeName: 'Milk Coffee thing',
                coffeePrice: '4.60',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
