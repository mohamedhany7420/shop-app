import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled9/components/components.dart';
import 'package:untitled9/modules/shopapp/loginSHopApp.dart';
import 'package:untitled9/network/remote/cachhelper.dart';
class boardModel{
  final String image;
  final String text1;
  final String text2;

  boardModel({
    required this.image,
    required this.text1,
    required this.text2,
});
}
class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
List<boardModel> boarding = [

  boardModel(
    image: 'assets/images/1.png',
    text1: 'ONLINE SHOPPING',
    text2: 'activity or action of buying products or services over the Internet. It means going online, landing on a seller’s website, selecting something, and arranging for its delivery.'
  ),
  boardModel(
      image: 'assets/images/2.png',
      text1: 'DISCOUNTS',
      text2: 'Sales upto 50% to save your money'
  ),
  boardModel(
      image: 'assets/images/3.png',
      text1: 'CONTACTLESS PAYMENT',
      text2: 'Quicker transactions and shorter queues at the checkout are the most significant advantages of contactless payment. Handling cash is not a concern at the checkout.'
  )
];
void skip(){
  cashHelper.saveData(key: 'onBoarding', value: true).then((value)
  {
    if (value)
    {
      navigateWithoutBack(context, ShopLogin());
    }
  });
  }

var boardController = PageController();
bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          TextButton(onPressed: (){
            skip();
            },
              child: Text(
                  'SKIP',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if(index== boarding.length-1)
                    {
                      setState(() {
                        isLast = true;
                      });
                    }
                  else
                    setState(() {
                      isLast = false;
                    });
                },
                itemBuilder:(context, index) => onboarditem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              children: [
              SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  expansionFactor: 5.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                  dotHeight: 7.0,
                  dotWidth: 7.0,
                ),
              ),
              Spacer(),
              FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                  onPressed: () {
                  if(isLast)
                    {
                   skip();
                    }
                  else
                    {
                      boardController.nextPage(
                          duration: Duration(
                              microseconds: 500
                          ),
                          curve: Curves.linearToEaseOut
                      );
                    }
                  } ,
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}
Widget onboarditem(boardModel modell) => Column(
  children: [
    Expanded(
      child: Image(
          image:
      AssetImage(
        '${modell.image}'
      ),
      ),
    ),
    SizedBox(
      height: 20.0,
    ),
    Text(
        '${modell.text1}',
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      '${modell.text2}',
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black38,
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  ],
);
