import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';



class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          ClipRRect(

            child: CustomImage(
              image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",
              height:MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, fit: BoxFit.fill,
            ),

          ),
          Positioned(
            top: 50,
            right:Get.locale!.languageCode=='ar'? 20:0,
            left:Get.locale!.languageCode=='en'? 20:0,
            child: Column(

              children: [
                Align(
                  alignment: Get.locale!.languageCode=='ar'?Alignment.topRight:Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.arrow_back_ios_sharp),
                    ),
                  ),
                ),
                SizedBox(height: 3,),
                Row(
                  children: [
                    ClipOval(
                      //  borderRadius: BorderRadius.circular(30),
                      child: CustomImage(

                        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs-QgBlLOHMcF27Gg6DWSG0PDN2EUwzV9D0A&usqp=CAU",
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'yaser hasan ',
                      style:TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              right:Get.locale!.languageCode=='en'? 20:-1,
              left:Get.locale!.languageCode=='ar'? 20:-1,
              bottom: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
            height: 50,
            width: 50,
            child: Icon(Icons.favorite_border,color: Colors.orange,size: 40,),
            decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
            ),
          ),
                ],
              ))
        ],
      ),
    );
  }
}
