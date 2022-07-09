import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variable for bottomsheet
  bool btmsheetopener = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //Top of the page -----> Application navigation bar
      appBar: AppBar(
        title: const Text("My version of Login"),
        backgroundColor: Colors.brown.shade300,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text("Action 1",
                  style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () {},
              child:
                  const Text("Action 2", style: TextStyle(color: Colors.white)))
        ],
      ),

      // -----------
      // --code in the main contents of the page here
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Login Here!",
                  style: TextStyle(
                      fontSize: size.height / 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900),
                )
              ]),
            ),

            const SizedBox(
              height: 10,
            ),

            //container to house image
             Container( height: size.height/4,
                        width: size.width/2,
                        decoration:  BoxDecoration(
                          image: const DecorationImage(image: AssetImage("assets/login_image.jpg"), 
                          fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100)
                        )),
                        

            const SizedBox(
              height: 10,
            ),
            //Form----
            Form(
                child: Column(
              children: [
                //Email field
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //Pasword
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                  ),
                ),

                //TextButton
                TextButton(
                    onPressed: () {},
                    child: Container(
                        color: Colors.green.shade900,
                        height: size.height / 18,
                        width: size.width / 4,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )))
              ],
            )),

            //Add Horizontal box
            horizontal_card(Icons.group, "Name", "Abraham"),
            const SizedBox(
              height: 10,
            ),

            horizontal_card(Icons.phone, "Phone", "08060214037"),
            const SizedBox(
              height: 10,
            ),

            horizontal_card(
                Icons.location_on_outlined, "Location", "Search FM"),
            const SizedBox(
              height: 10,
            ),

            
            //Add Vertical box
            vertical_card(),
          ],
        ),
      ),
      // -----------

      //floating button here
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          btmsheetopener = true;
          setState(() {});
        }),
        backgroundColor: Colors.brown.shade300,
        child: const Text("Open"),
      ),

      //End of the page---->Bottom Navigation
      bottomNavigationBar: Container(
        height: size.height / 16,
        color: Colors.brown.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add_task_rounded,
                  color: Colors.white,
                ),
                Text(
                  "Todo",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.auto_stories,
                  color: Colors.white,
                ),
                Text(
                  "Courses",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.bubble_chart_outlined,
                  color: Colors.white,
                ),
                Text(
                  "Chat",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),

      //---- call the bottom sheet here widget here
      bottomSheet: bUttoMsheet(),
    ));
  }

  //Bottom sheet code here
  Widget? bUttoMsheet() {
    if (btmsheetopener) {
      return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 150,
              color: Colors.grey,
              alignment: Alignment.center,

              //the content
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        btmsheetopener = false;
                        setState(() {});
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            );
          });
    } else {
      return null;
    }
  }

//THIS PART IS FOR DYNAMIC CONTENT
  //Horizontal box
  Widget horizontal_card(IconData Ic, String s1, String s2) {
    return Container(
      height: 100,
      color: Colors.green.shade100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: Icon(Ic, size: 45, color: Colors.green.shade800),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s1,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(s2,
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                ],
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.green.shade800,
          ),
        ],
      ),
    );
  }

  //Vertical box
  Widget vertical_card() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //conainer 1
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          width: 180,
          decoration:  BoxDecoration(
            image: const DecorationImage(image: AssetImage("assets/login_image.jpg"),
            fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(50),
          ),
          
          //Text on the image
          child: const Center(child: Text("Image 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),)),
        ),
      ),
     
      //conainer 2
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          width: 180,
          decoration:  BoxDecoration(
            image: const DecorationImage(image: AssetImage("assets/login_image.jpg"),
            fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(50),
          ),
          
          //Text on the image
          child: const Center(child: Text("Image 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),)),
        ),
      ),

      
    ],);
  }
}
