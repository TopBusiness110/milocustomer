
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milocustomer/config/routes/app_routes.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/assets_manager.dart';
import 'package:milocustomer/core/utils/getsize.dart';
import 'package:milocustomer/core/widgets/custom_button.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';

class OrderView extends StatelessWidget {
  final bool isRunning;
  final bool isSubscription;

  const OrderView(
      {Key? key, required this.isRunning, this.isSubscription = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body:    
        //orderList != null ? orderList.isNotEmpty ?
        RefreshIndicator(
        onRefresh: () async {
    },
    child: Center(
    child: SizedBox(
    width: getSize(context),
    child: ListView.builder(
    padding:  EdgeInsets.all(getSize(context)/22),
    itemCount: 10,
    //   physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
    return InkWell(
    onTap: () {
    // Get.toNamed(
    // RouteHelper.getOrderDetailsRoute(orderList![index].id),
    // arguments: OrderDetailsScreen(
    // orderId: orderList[index].id,
    // orderModel: orderList[index]),
    // );
    },
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
    children: [
    Positioned(
    child: Padding(
    padding: const EdgeInsets.only(top: 18),
    child: Container(

    width: MediaQuery.of(context).size.width,
    padding:  EdgeInsets.all(
   getSize(context)/22),
    margin:EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(
    getSize(context)/22),
    border: Border.all(color: Colors.orange),
    boxShadow: [
    BoxShadow(
    color: Colors.grey[
    Get.isDarkMode ? 700 : 300]!,
    blurRadius: 5,
    spreadRadius: 1)
    ],
    ),
    child: Column(
    children: [
    SizedBox(
    height: 5,
    ),
    Row(
    children: [
    SizedBox(width: 70),
    Row(
    children: [
    ClipOval(
    //  borderRadius: BorderRadius.circular(30),
    child: CustomImage(
    image:
    "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",
    height: 50,
    width: 50,
    fit: BoxFit.cover,
    ),
    ),
    SizedBox(
    width: 4,
    ),
    Text(
    'yaser hasan ',
    style: TextStyle(
    fontSize: 10,
    color: Colors.black),
    )
    ],
    ),
    Spacer(),
    Row(


    children: [
    ClipOval(
    //  borderRadius: BorderRadius.circular(30),
    child: Image.asset(ImageAssets.hours,
    height: 16, width: 16),
    ),
    SizedBox(
    width: 2,
    ),
    Text(
    'منذ 4 ساعات',
    style: TextStyle(
    fontSize: 10,
    color: Colors.black),
    )
    ],
    )
    ],
    ),
    SizedBox(
    height: 5,
    ),
    Container(
    color: Colors.grey[300],

    child: Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Row(

    children: [
    Image.asset(ImageAssets.type,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'نوع تقديم الطعام:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 80,),
    Text(
    'بوفيه',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.guest1,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'عدد الضيوف:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 80,),
    Text(
    '11-25 فرد',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.servicetype,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'نوع الخدمه:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 80,),
    Text(
    'توصيل فقط',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    )
    ,
    Row(

    children: [
    Image.asset(ImageAssets.food,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'المطبخ المفضل',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 90,),
    Text(
    'اسيوى',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.vip,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'مناسبة:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 125,),
    Text(
    'عيد ميلاد',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.add,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'الطلبات الاضافيه:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 20,),
    Text(
    'موسيقى لايف',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.home1,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'نوع الحدث:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 80,),
    Text(
    'فى الداخل',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.pay,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'تاريخ الحدث:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 40,),
    Text(
    '3 مارس 2023',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.timer1,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'وقت الحدث:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 100,),
    Text(
    '21:00',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.dolar,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'ميزانيه:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 132,),
    Text(
    '500\$',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.address1,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'عنوان الشارع :',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 70,),
    Text(
    'امستردام',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    Padding(

    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Divider(
    color: Colors.white,
    ),
    ),
    Row(

    children: [
    Image.asset(ImageAssets.mizan,
    height: 16, width: 16),
    SizedBox(
    width: 4,
    ),
    Text(
    'احتياجات غذائية خاصة:',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    ),
    SizedBox(width: 35,),
    Text(
    'نباتى',
    style: TextStyle(
    fontSize: 18,
    color: Colors.black),
    )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),


    ],
    ),
    ),
    ),
    SizedBox(height: 20,),
    CustomButton(
    color: Colors.blue,

    onClick: (){
    index % 2 == 0 ?
 Navigator.pushNamed(context, Routes.addorder):
   Navigator.pushNamed(context, Routes.restaurantOffer);


    },
    textcolor: AppColors.blue,
    paddingHorizontal: 10,

    text:
    '${index % 2 == 0 ? 'تعديل' : index % 3 == 0 ? 'مشاهدة العروض' : 'مشاهدة العروض'}',

    ),
    SizedBox(
    height: 5,
    ),
    ],
    ),
 
    ),
    ),
    ),
    Positioned(
    top: 0,
    child: Container(
    width: 70,
    height: 70,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: index % 2 == 0
    ? Colors.green
        : index % 3 == 0
    ? Colors.blue
        : Colors.pink,
    ),
    child: Center(
    child: Text(
    '${index % 2 == 0 ? 'جديد' : index % 3 == 0 ? 'قيد التفاوض' : 'مغلق'}',
    style: TextStyle(
    fontSize: 12, color: Colors.white),
    ),
    ),
    ))
    ],
    ),
    ),
    );
    },
    ),
    )),
    ),
    );
  }
}
