import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';
import 'package:flutter/material.dart';


class HealthyEatingContent extends StatelessWidget {
//  final String email;
////  final screenHeight = MediaQuery.of(context).size.height;
//
//  HealthyEatingContent({@required this.email});

//  Home({this.email});

//LoginState login =  LoginState();

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
          backgroundColor: Colors.blueGrey,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthTipsMenu()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // height: 5200,
            height: 5300,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(//----------------Healthy Eating-----------------------------//
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "\nHealthy Eating\n",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/fruits_veggie.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: Text(
                      "What kinds of foods and drinks do I need to consume as I age?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "As you get older, your body begins to need fewer calories, but you need "
                          "just as many nutrients. So, you will want to focus on eating nutrient-dense foods. "
                          "Nutrient-dense foods pack a lot of vitamins, minerals,"
                          " and other nutrients your body needs into a smaller number of calories.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consume more nutrient-dense foods and beverages. Older adults should consume"
                          " foods from the rainbow because they are rich in nutrients, including",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- fruits and vegetables\n\n"
                          "- whole grains, like oatmeal, whole-grain bread, and brown rice\n\n"
                          "- fat-free or low-fat milk; milk products; or nondairy soy, almond, rice,\n\n"
                          " or other drinks with added vitamin D and calcium\n\n"
                          "- seafood, lean meats, poultry, and eggs\n\n"
                          "- beans, peas, unsalted nuts, and seeds, if you tolerate them and aren’t allergic",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consume less of these foods and drinks. Some foods and drinks have many calories but "
                          "few of the essential nutrients your body needs. Added sugars, solid fats, and salt—such "
                          "as those in packaged foods—pack a lot of calories but don’t provide a healthy amount"
                          " of nutrients. Limit foods and drinks such as",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- sugar-sweetened drinks and foods\n\n"
                          "- sugar-sweetened drinks and foods\n\n"
                          "- foods made with solid fats—butter, lard, margarine, and shortening\n\n"
                          "- foods high in added fat (such as butter or lard) and salt (sodium)\n\n"
                          "- sugar-sweetened drinks and foods",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top: 20, bottom: 20),
                    child: Text(
                      "How can I follow a healthy eating plan?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "How much food and drinks you should consume each day depends on your weight,"
                          " sex, age, metabolism, and how active you are. In general, men need more "
                          "calories than women. Younger adults need more calories than adults in midlife and older. "
                          "At all ages, adults who are more physically active may need to consume more calories than"
                          " those who are less active.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Control portion sizes. A portion is the amount of food or drink you consume in one sitting."
                          " Being aware of food portions,"
                          " serving sizes, and how often you consume them can help you make healthier food and drink choices.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Many people eat more than they need, especially when eating out or getting takeout. Try these tips.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20),
                    child: Text(
                      "- Remember, restaurants often serve more than one portion. If the portion"
                          " is bigger than one serving, take home or put away the rest to eat later.\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "- When eating out or getting takeout, share a meal with a friend or save half of your serving for another meal.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "- Avoid watching TV, your smartphone, or other devices while eating. "
                          "You may not notice how much you are consuming if you’re distracted.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "- Consume your food and beverages more slowly and enjoy all the flavors and tastes.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "The Nutrition Facts label tells you how many calories and servings are in a box, package, or can."
                          " The label also shows how many nutrients, such as fat, protein, carbohydrates, fiber, sodium,"
                          "and sugar—including added sugars—are in one serving of food. You can use these facts to make "
                          "healthy food choices. Learn how to read Nutrition Facts labels ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Cook ahead and freeze food for days when you don't want to cook.\n\n"
                          "- Keep low-sodium versions of frozen or canned vegetables and beans on hand for quick and healthy meal add-ons.\n\n"
                          "- Keep frozen or packed-in-juice canned fruits ready for snacks and meals.\n\n"
                          "- Do not skip meals. Doing so may make you feel hungrier later.",


                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/meal.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Cook ahead and freeze food for days when you don't want to cook.\n\n"
                          "- Keep low-sodium versions of frozen or canned vegetables and beans on hand for quick and healthy meal add-ons.\n\n"
                          "- Keep frozen or packed-in-juice canned fruits ready for snacks and meals.\n\n"
                          "- Do not skip meals. Doing so may make you feel hungrier later.",


                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(//----------------Healthy Eating Tips-----------------------------//
                    margin: EdgeInsets.only(left: 20, top: 20, bottom:20),
                    child: Text(
                      "\nHealthy Eating Tips",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/diet2.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top:20),
                    child: Text(
                      "Vitamins and minerals for older adults",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Vitamins and minerals are nutrients that help your body stay healthy and work well. "
                          "Many kinds of vitamins and minerals work together to help you get energy from food. "
                          "By following a healthy eating plan, you are more likely to get all or most of the "
                          "vitamins and minerals you need from the food and drink you consume.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Getting enough of vitamins B6, B12, D, and folate is considered important to healthy aging. "
                          "Talk with your health care professional about the vitamins you need. Based on your eating "
                          "plan and health status, your health care professional may suggest a supplement to help you"
                          " get the vitamins and minerals you need. ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20),
                    child: Text(
                      "Tips for consuming healthy food and beverages on a budget",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consuming healthy foods and beverages on a fixed or limited income or budget can be very difficult."
                          " Here are some ideas that might help.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Buy store brands of whole-grain breads, pastas, cereals, and other healthy items.\n\n"
                          "- Read weekly sales flyers and use coupons or apps to plan healthy meals and snacks at lower prices. Eat what is in season to get the best deals on fresh vegetables and fruits.\n\n"
                          "- Buy low-sodium versions of canned or frozen vegetables. They are healthy, low-cost, and store well until you need them.\n\n"
                          "- Consider joining food voucher programs sponsored by places of worship or food banks to improve your access to healthy foods and beverages.\n\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:40, top:20),
                    child: Text(
                      "Tips for limiting sodium in your diet",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),






                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consuming too much sodium (salt) may lead to health problems, such as high blood pressure, for some.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Lower your sodium intake to less than 2,300 mg a day \n\n"
                          "(about a teaspoon of salt). That includes sodium added during packaging, cooking, and at the table when eating.\n\n"
                          "- Read the Nutrition Facts label on foods and beverages to find the sodium content.\n\n"
                          "- Buy foods and beverages that are low in sodium.\n\n"
                          "- Limit how much packaged and fast foods and beverages you consume.\n\n"
                          "- Use less salt when cooking and eating.\n\n"
                          "- Cook with lemon and spices that have no sodium.\n\n",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    //-----------------------------------------------------------------------------------------------back Next

                    margin: EdgeInsets.only(top: 5,left:50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthTipsMenu()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP2()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),




                ],
              ),
            ),
          ),

//          Container(
//            margin: EdgeInsets.only(left:50,top:50),
//            height: 60,
//            width:60,
//
//            child: CircleAvatar(
//              radius: 5,
//              backgroundColor: Colors.lightBlue,
//             child: Icon(
//               Icons.person,
//                   color: Colors.white,
//               size: 30,
//             ),
//            ),
//          )
        ),
      ),
    );
  }
}

class HealthyEatingContentP2 extends StatelessWidget {


//  Home({this.email});

//LoginState login =  LoginState();

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthyEatingContent()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 5500,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 50, bottom:20, right: 20),
                    child: Text(
                      "Keep track of your eating habits",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20),
                    child: Text(
                      "Many factors may affect your ability to eat well and enjoy your meals and snacks, including dental problems, being on a fixed income, and limited ability to move around.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "If you don’t have pain in your fingers or hands when writing, try to keep a food diary. Write down all the foods and drinks you have in a day"
                          " and any concerns you have. Instead of a written diary, consider trying one of the many apps now available on mobile phones, tablets, and "
                          "other devices. These apps have become a popular way to track and improve health habits, including what and how much you eat and drink, sleep, and weigh."
                          " When you visit your health care provider, bring your written or digital food diary and review it together to see if you are getting the nutrients you need.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Your health care professional may recommend that you have different foods and beverages or that you change the number "
                          "of calories you get each day. He or she may also refer you to a registered dietitian for help with choosing an eating "
                          "plan that’s right for you.\n\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/fruit.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(//---------------------Fruits-------------------//
                    margin: EdgeInsets.only(left:5, top:20),
                    child: Text(
                      "Fruits",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Fresh, frozen, or canned fruits are great choices. Try"
                          "\ fruits beyond apples and bananas such as mango,"
                          " pineapple or kiwi fruit. When fresh fruit is not in"
                          " season, try a frozen, canned, or dried variety. Be"
                          " aware that dried and canned fruit may contain added"
                          " sugars or syrups. Choose canned varieties of fruit"
                          " packed in water or in its own juice.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/vegie.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(//----------------------Vegetables---------------------//
                    margin: EdgeInsets.only(left:5, top:20),
                    child: Text(
                      "Vegetables",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Add variety to grilled or steamed vegetables with an herb"
                          " such as rosemary. You can also sauté (panfry) veget"
                          "ables in a non-stick pan with a small amount of cooking "
                          "spray. Or try frozen or canned vegetables for a quick side"
                          " dish—just microwave and serve. Look for canned vegetables"
                          " without added salt, butter, or cream sauces. For variety,"
                          " try a new vegetable each week",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/milk.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(//----------------------Calcium Rich foods---------------------//
                    margin: EdgeInsets.only(left:5, top:20),
                    child: Text(
                      "Calcium-rich foods",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "In addition to fat-free and low-fat milk, consider low-fat"
                          " and fat-free yogurts without added sugars. These come"
                          " in a variety of flavors and can be a great dessert"
                          " substitute.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/chicken.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(//--------------Meat---------------------//
                    margin: EdgeInsets.only(left:5, top:20),
                    child: Text(
                      "Meat",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "If your favorite recipe calls for frying fish or breaded chicken, try healthier"
                          " variations by baking or grilling. Maybe even try dry beans in place of meats."
                          " Ask friends and search the internet and magazines for recipes with fewer"
                          " calories ― you might be surprised to find you have a new favorite dish!",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/pasta.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(//--------------Comfort Foods---------------------//
                    margin: EdgeInsets.only(left:5, top:20),
                    child: Text(
                      "Comfort Foods",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "You can still enjoy your favorite foods, even if they are high",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Some general tips for comfort foods:",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Eat them less often. If you normally eat these foods every day, cut back to once a week or once a month.\n\n"
                      "- Eat smaller amounts. If your favorite higher-calorie food is a chocolate bar, have a smaller size or only half a bar.\n\n"
                      "- Try a lower-calorie version. Use lower-calorie ingredients or prepare food differently. "
                      "For example, if your macaroni and cheese recipe includes whole milk, butter,"
                      " and full-fat cheese, try remaking it with non-fat milk, less butter, "
                      "low-fat cheese, fresh spinach and tomatoes. Just remember to not increase"
                      " your portion size.\n\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/water.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(//--------------Water---------------------//
                    margin: EdgeInsets.only(left:5, top:20),
                    child: Text(
                      "Benefits of Drinking Water",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Getting enough water every day is important for your health. Drinking water can prevent"
                          " dehydration, a condition that can cause unclear thinking, result in mood change,"
                          " cause your body to overheat, and lead to constipation and kidney stones."
                          " Water has no calories, so it can also help with managing body weight and "
                          "reducing calorie intake when substituted for drinks with calories, such as sweet"
                          " tea or regular soda.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Water helps your body:\n\n"

                    "- Keep a normal temperature.\n\n"
                    "- Lubricate and cushion joints.\n\n"
                    "- Protect your spinal cord and other sensitive tissues.\n\n"
                    "- Get rid of wastes through urination, perspiration, and bowel movements.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Your body needs more water when you are:\n\n"

                      "- In hot climates.\n\n"
                      "- More physically active.\n\n"
                      "- Running a fever.\n\n"
                      "- Having diarrhea or vomiting.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Everyone should consume water from foods and beverages every day.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Daily total water intake (fluid) is defined as the amount"
                          " of water consumed from foods, plain drinking water, "
                          "and other beverages. Daily water intake recommendations"
                          " vary by age, sex, pregnancy status, and breastfeeding status. "
                          " Most of your fluid needs are met through the water and other"
                          " beverages you drink. You can get some fluids through the foods "
                          "that you eat—especially foods with high water content, such as"
                          " many fruits and vegetables. Drinking water is one good way of"
                          " getting fluids as it has zero calories.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Tips to Drink More Water",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Carry a water bottle with you and refill it throughout the day.\n\n"
                      "- Freeze some freezer safe water bottles. Take one with you for ice-cold water all day long.\n\n"
                      "- Choose water over sugary drinks.\n\n"
                      "- Opt for water when eating out. You’ll save money and reduce calories.\n\n"
                      "- Serve water during meals.\n\n"
                      "- Add a wedge of lime or lemon to your water. This can help improve the taste.\n\n"
                      "- Make sure your kids are getting enough water too. Learn more about drinking water.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Healthier Drink Options",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Of course, there are many other beverage options besides water, "
                      "and many of these can be part of a healthy diet. ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Low- or no- calorie beverages",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Plain coffee or teas, sparkling water, seltzers, and flavored waters, "
                          "are low-calorie choices that can be part of a healthy diet.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Drinks with calories and important nutrients",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Low-fat or fat-free milk; unsweetened, fortified milk alternatives;"
                          " or 100% fruit or vegetable juice contain important nutrients"
                          " such as calcium, potassium, or vitamin D. These drinks should"
                          " be enjoyed within recommended calorie limits.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),







                  Container(
                    //-----------------------------------------------------------------------------------------------back Next

                    margin: EdgeInsets.only(top: 50,left:50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContent()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP3()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class HealthyEatingContentP3  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthyEatingContentP2()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 5500,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 50, bottom:20, right: 20),
                    child: Text(
                      "Other Beverages\n",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/soda.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Sugary drinks",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),



                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Regular sodas, fruit drinks, sports drinks, energy drinks,"
                          " sweetened waters, and sweetened coffee and tea beverages, "
                          "contain calories but little nutritional value.\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/alcoholics.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Alcoholic drinks",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),



                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "If you choose to drink alcohol, do so in moderation.\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/coffee.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Caffeinated drinks",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Moderate caffeine consumption (up to 400 mg per day) can be a part of a "
                          "healthy diet."" That’s up to about 3 to 5 cups of plain coffee.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/diet_coke.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Drinks with sugar alternatives",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Drinks that are labeled “sugar-free” or “diet” likely contain high-intensity"
                          " sweeteners, such as sucralose, aspartame, or saccharine."
                          " According to the Dietary Guidelines for Americans, “replacing added "
                          "sugars with high-intensity sweeteners may reduce calorie intake in the "
                          "short-term…yet questions remain about their effectiveness as a long-term"
                          " weight management strategy",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/sports_drink.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Sports drinks",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "These are flavored beverages that often contain carbohydrates, "
                          "minerals, electrolytes, and sometimes vitamins. The average "
                          "person should drink water, not sports drinks, to rehydrate.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "What are added sugars?",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Added sugars are sugars and syrups that are added to foods or beverages "
                          "when they are processed or prepared. Naturally occurring sugars such"
                          " as those in fruit or milk are not added sugars.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Added sugars have many different names. Examples of added sugars include brown"
                          " sugar, cane juice, corn syrup, dextrose, fructose, fruit nectars, glucose,"
                          " high-fructose corn syrup, honey, lactose, malt syrup, maltose, maple syrup,"
                          " molasses, raw sugar, and sucrose.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "What are the health consequences of too much sugar?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Added sugars contribute calories to your diet, but no essential nutrients."
                          " Eating and drinking too many added sugars makes it difficult to achieve"
                          " a healthy eating pattern without taking in too many calories.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Too much sugar in your diet can lead to health problems such as weight gain"
                          " and obesity, type 2 diabetes, and heart disease.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "How much is too much?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "According to the Dietary Guidelines for Americans, people older than 2 years"
                          " should keep sugars to less than 10% of their total daily calories. "
                          "For example, if an adult consumes 2,000 calories a day, no more than 200"
                          " calories should come from added sugars. Or, if toddlers consume 1,200"
                          " calories a day, no more than 120 calories should come from added sugars.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Make a Change",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Sugary drinks are the leading source of added sugars in the American diet. ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Planning Meals",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/diet_list.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "You eat in a variety of places – your home, work, restaurants,"
                          " maybe even your car. For some of these places, you have more "
                          "control over what choices are available than others. Since high-calorie"
                          " foods are everywhere, it’s important to take the time to plan ahead to "
                          "make sure you have healthy options available.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Meals at Home",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Whether you are cooking for just yourself, one to two people, or a larger group,"
                          " planning meals is a good place to start improving your food choices. "
                          "Taking the time to plan a healthy evening meal can help you avoid a "
                          "less healthful “drive-through” dinner.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "To start, grab a pencil and paper and list your favorite meals. It may help to talk "
                          "to your family or thumb through a favorite cook book. Some of the meals will "
                          "be healthier than others, but for now, just write them all down.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "You might want to use MyPlate Plan. The plan will show you your daily food group targets"
                          " — what and how much to eat within your calorie allowance. It can help you plan your"
                          " upcoming meals to meet your weight goals and suggest ways to improve choices.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Once you’ve planned your meals, make a grocery list. Take some time on your visit to the "
                          "grocery store to choose lower-calorie ingredients. Here are some ideas that may help:",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Many casseroles and meat sauces use cream soups as a base. Use a low-fat cream soup.\n\n"
                        "Substitute a low-fat cheese in casseroles and vegetable sauces. When using sharply "
                          "flavored cheese, such as cheddar and parmesan, you can usually reduce the amount in "
                          "a recipe to save calories without sacrificing flavor.\n\n"
                    "- Try a non-stick cooking spray or a small amount of cooking oil for sautéing instead of "
                          "frying with solid fat.\n\n"
                    "- If you’re using ground beef for tacos or meat sauce for spaghetti, look for a lower-fat "
                          "variety such as ground round or ground sirloin or try using skinless ground turkey breast. "
                          "Once you’ve browned the meat, drain to remove excess fat.\n\n"
                    "- Instead of full-fat versions of mayonnaises, butter, and salad dressings, "
                          "try those that are lower in calories, total fat, saturated fat, and trans fat.\n\n"
                    "- Check out the frozen food aisles for quick, low-calorie vegetable side dishes."
                          " You can find cut green beans, sliced carrots, and other chopped vegetables"
                          " in the frozen food section. Avoid the ones with added cream, butter, or "
                          "cheese sauces as these ingredients can add calories. You can steam these"
                          " vegetables quickly in the microwave.\n\n"
                    "- In some soups and entrees, you may also be able to add dry beans to extend the"
                          " recipe and improve the nutritional value. This is easy to do in vegetable"
                          "-based soups and chili. You can just add a cup of canned white beans, "
                          "kidney beans, or pinto beans to the recipe. As another example, if you are"
                          " making enchiladas, rinse a can of black beans and add these to the ground meat.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Research shows that people get full by the amount of food they eat, not the number of "
                          "calories they take in. You can cut calories in your favorite foods by lowering "
                          "the amount of fat and or increasing the amount of fiber-rich ingredients, such "
                          "as vegetables or fruit. Eating fewer calories doesn’t necessarily mean eating "
                          "less food. To learn more, visit Eat More, Weigh Less? And see How to Use Fruits "
                          "and Vegetables to Help Manage Your Weight for more information.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),


                  Container(
                    //-----------------------------------------------------------------------------------------------back Next

                    margin: EdgeInsets.only(top: 50,left:50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP2()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP4()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}

class HealthyEatingContentP4  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthyEatingContentP3()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 4500,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 50, bottom:20, right: 20),
                    child: Text(
                      "At first, you may find you only get a lower calorie meal planned for"
                          " one or two nights a week. Don’t criticize yourself; you’re making"
                          " steps in the right direction. Over time, you’ll figure out meal-"
                          "preparation short-cuts and it will become easier to make healthy"
                          " family meals a regular occurrence.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Meals on the Go",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "For the places where you might grab a snack or have a meal on the go (such "
                          "as the car or at your desk), make sure you have nutritious snacks available"
                          " or at home that you can take with you. For example:",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Grab-and-go” fruits: apples, oranges, bananas, canned fruit without added sugars, and raisins\n\n"
                      "- Washed and chopped fresh vegetables: celery, carrots, and cucumbers"
                      "- Low-fat and fat-free milk products: yogurt without added sugars, milk, and low-fat cheeses\n\n"
                    "- Whole-grain crackers and breads\n\n"
                    "- Protein choices such as low-fat deli turkey slices or almonds and other nuts and seeds",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Take the time to make a shopping list and re-stock your cabinets and fridge with healthy "
                          "options. It’s also a good idea to think about stocking your office cabinet or car glove"
                          " box with healthy shelf-stable treats if these are places where you snack. You’ll find "
                          "it’s easier to make better choices when you have a good variety of nutritious foods "
                          "available in the places where you eat.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Cutting Calories\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(

                    child: Image.asset(
                        'assets/images/calories.png',
                      height: 100,
                      width: 130,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Eat More, Weigh Less?",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Eating fewer calories doesn’t necessarily mean eating less food."
                          " To be able to cut calories without eating less and feeling hungry,"
                          " you need to replace some higher calorie foods with foods that are lower"
                          " in calories and   fill you up. In general, these foods contain a lot"
                          " of water and are high in fiber",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Rethink Your Drink",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Most people try to reduce their calorie intake by focusing on food,"
                          " but another way to cut calories may be to change what you drink."
                          " You may find that you’re consuming quite a few calories just in"
                          " the beverages you have each day. Find out how you can make better"
                          " drink choices to reduce your calorie intake.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "How to Avoid Portion Size Pitfalls to Help Manage Your Weight",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "You may find that your portion sizes are leading you to eat more calories "
                          "than you realize. Research shows that people unintentionally consume more"
                          " calories when faced with larger portions. This can mean excessive "
                          "calorie intake, especially when eating high-calorie foods.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "How to Avoid Portion Size Pitfalls to Help Manage Your Weight",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "When eating at many restaurants, it’s hard to miss that portion sizes have"
                          " gotten larger in the last few years. The trend has also spilled over "
                          "into the grocery store and vending machines, where a bagel has become "
                          "a BAGEL and an “individual” bag of chips can easily feed more than one."
                          " Research shows that people unintentionally consume more calories when"
                          " faced with larger portions. This can mean significant excess calorie"
                          " intake, especially when eating high-calorie foods. Here are some tips"
                          " to help you avoid some common portion-size pitfalls.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Portion control when eating out.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Many restaurants serve more food than one person needs at one meal. Take control"
                          " of the amount of food that ends up on your plate by splitting an entrée "
                          "with a friend. Or, ask the wait person for a “to-go” box and wrap up half "
                          "your meal as soon as it’s brought to the table.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Portion control when eating in.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "To minimize the temptation of second and third helpings when "
                          "eating at home, serve the food on individual plates, instead"
                          " of putting the serving dishes on the table. Keeping the excess"
                          " food out of reach may discourage overeating.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Portion control in front of the TV.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "When eating or snacking in front of the TV, put the amount that you"
                          " plan to eat into a bowl or container instead of eating straight"
                          " from the package. It’s easy to overeat when your attention is "
                          "focused on something else.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Go ahead, spoil your dinner",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "We learned as children not to snack before a meal for fear of “spoiling "
                          "our dinner.” Well, it’s time to forget that old rule. If you feel"
                          " hungry between meals, eat a healthy snack, like a piece of fruit"
                          " or small salad, to avoid overeating during your next meal.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Be aware of large packages.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "For some reason, the larger the package, the more people consume"
                          " from it without realizing it. To minimize this effect:",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Divide up the contents of one large package into several smaller containers to help avoid over-consumption.\n\n"
                      "- Don’t eat straight from the package. Instead, serve the food in a small bowl or container.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Out of sight, out of mind.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "People tend to consume more when they have easy access to food."
                          " Make your home a “portion friendly zone.”",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Replace the candy dish with a fruit bowl.\n\n"
                      "- Store especially tempting foods, like cookies, chips, or ice cream,"
                          " out of immediate eyesight, like on a high shelf or at the back "
                          "of the freezer. Move the healthier food to the front at eye level.\n\n"
                      "- When buying in bulk, store the excess in a place that’s not convenient "
                          "to get to, such as a high cabinet or at the back of the pantry.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),


























                  Container(
                    //-----------------------------------------------------------------------------------------------back Next

                    margin: EdgeInsets.only(top: 50,left:50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP3()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP4()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}