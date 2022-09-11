import 'package:auto_size_text/auto_size_text.dart';
import 'package:ezzproject/logic/detailpage.dart';
import 'package:ezzproject/logic/mainlogic.dart';
import 'package:ezzproject/screens/location.dart';
import 'package:ezzproject/screens/users/shoppingcart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'allreviews.dart';
import 'marasil_detail2.dart';
import 'notification.dart';
class Marasildetail1 extends StatefulWidget{
  var providerid;
  Marasildetail1({this.providerid});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Statemarasildetail1(providerid: providerid);
  }
}
class Statemarasildetail1 extends State<Marasildetail1>{
  var detaildata;
  Detailpagelogic detailpagelogic;
  var providerid;
  Statemarasildetail1({this.providerid});
  @override
  void initState() {
    detailpagelogic = new Detailpagelogic(context);
    super.initState();
    getdata();
  }
  List housesimg = [5,3,2];
  int totalprice ;
  var download;
  getdata()async{
    await Provider.of<Notifires>(context,listen: false).getdetailpage(providerid);
    Provider.of<Notifires>(context,listen: false).getdatadetailpage(detaildata["Products"]);
  }
  navigatetoshopping(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return Shoppingcard();
    }));
  }
  var value_type="";
  List value_types =[];
  navigatetonotification(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return Notifications();
    }));
  }
  @override
  Widget build(BuildContext context) {
     totalprice = Provider.of<Notifires>(context).totalprice;
     detaildata = Provider.of<Notifires>(context).provider;
     download = Provider.of<Notifires>(context).downloaddetailpage;
     var iconofshop = Provider.of<Notifires>(context).iconofshopstate;
    // TODO: implement build
    return Scaffold(body: Container(width:  MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
      child:
        Container(
          child:detaildata == null?Container(child: Center(child: CircularProgressIndicator(),),): ListView(children: [
            Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.12,child :
              Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.12,
                decoration: BoxDecoration(color: Color.fromRGBO(42, 171, 227, 1),borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60))),child: Row(children: [
                  Expanded(flex: 2,child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),child: IconButton(icon: Icon(Icons.arrow_back,size: MediaQuery.of(context).size.width*0.06,color: Colors.white,),onPressed: (){navigateback();},))),
                  Expanded(flex: 9,child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1) ,alignment: Alignment.center,child: Directionality( textDirection: TextDirection.rtl,child: Text(detaildata["Name"].toString(),style: TextStyle(color: Colors.white,fontSize: 17),)))),
                  Expanded(flex: 2,child: Provider.of<Notifires>(context).guestmode?Container() :InkWell(onTap: ()=>navigatetonotification(),child: SvgPicture.asset("images/Icon-alarm.svg",semanticsLabel: "wadca",))),
                  Expanded(flex: 3,child:Provider.of<Notifires>(context).guestmode?Container() :InkWell(onTap: ()=>navigatetoshopping(),child:iconofshop=="1"?Stack(children:[ Container(child:SvgPicture.asset("images/Icon feather-shopping-cart.svg",semanticsLabel: "wasdca", )),Positioned(top: 2,left: 20 ,child: Container(width: 10,height: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red,),)),])
                      :Container(margin: EdgeInsets.only(right: 15),child:SvgPicture.asset("images/Icon feather-shopping-cart.svg",semanticsLabel: "wasdca", ))) )
                ],),) ),
            Container(child:Stack(children:[ Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.3,child: FadeInImage(fit: BoxFit.fill,placeholder: AssetImage("images/logoaz.png"),image:NetworkImage(detaildata["Photo"]) ,),),
              Positioned(left: MediaQuery.of(context).size.width*0.8,top: MediaQuery.of(context).size.height*0.05,
                child: Container(child:detaildata["BestSeller"].toString()=="1"?
                InkWell(onTap: ()=>null,
                  child: Container(alignment: Alignment.centerRight ,width: 72,padding: EdgeInsets.all(3),
                    height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromRGBO(254, 254, 115, 1)),child:
                    FittedBox(child: Row(children:[ Text("بائع مميز",style: TextStyle(color: Color.fromRGBO(8, 67, 143, 1),fontSize: 16),),Container(width: 20,height: 20,child: Image( image:AssetImage("images/thumbs-up.png"),fit: BoxFit.fill)),])),),
                ):Container()),
              )]))
            ,
            Directionality(textDirection: TextDirection.rtl,
                child: Container(width: MediaQuery.of(context).size.width,child: Row(children:[
                  Expanded(flex: 4,child: Container(child: Text(detaildata["Name"].toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.07,top: MediaQuery.of(context).size.height*0.01),)),
                  Expanded(child:  Container())]),
                )),
            Directionality(textDirection: TextDirection.rtl, child: Container(child: Text(detaildata["Description"].toString(),style: TextStyle(fontSize: 12,color: Colors.black38),),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.07),)),
            Container(child: Row(children: [
              Expanded(flex: 3,child: Container( child: Text(detaildata["Location"].toString(),style: TextStyle(fontSize: 12,color: Colors.black54),),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.07,top: MediaQuery.of(context).size.height*0.01),) ),
              Expanded(child: Container(child: Text("الموقع",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black),),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.07,top: MediaQuery.of(context).size.height*0.01),) )
            ],),),
            Container(margin: EdgeInsets.only(right: 10) ,child: Row(children: [
              Expanded(flex: 2,child: Container(child: Text(detaildata["WorkTime"].toString(),maxLines: 1,style: TextStyle(fontSize: 12,color: Colors.black54),),alignment: Alignment.centerRight,margin: EdgeInsets.only(left: 20 ,right: 1,top: MediaQuery.of(context).size.height*0.01),)),
              Expanded(child:  Container(child: Text("مواعيد العمل",maxLines: 1,style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.black),),alignment: Alignment.centerRight,margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1 ,right: MediaQuery.of(context).size.width*0.05,top: MediaQuery.of(context).size.height*0.01),))
            ],),),
            Container( margin: EdgeInsets.only(top: 10,right: 7),child: Row(children: [
              Expanded(flex: 5,child:Provider.of<Notifires>(context).guestmode?Container() : Container(child: InkWell(onTap: ()=>navigatetoallreview(detaildata["Rating"],detaildata["UserID"]),child: AutoSizeText("مشاهدة تقييم البائع",maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color.fromRGBO(246, 7, 7, 1)),)),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: 30),))
              ,Expanded(child: Container( child: Text(detaildata["Rating"].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),alignment: Alignment.centerRight,) ),
              Expanded(child: Container( child: Icon(Icons.star,color: Colors.yellow.withGreen(1000),size: 20,),alignment: Alignment.centerRight,margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),))
              ,Expanded(flex: 3,child:  Container( child: Text("التقييم",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05 ,left: MediaQuery.of(context).size.width*0.13),))
            ],),),
          Container(child: Divider(color: Colors.black38,),margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07,right:MediaQuery.of(context).size.width*0.07 ),)
          , Container(
              child:Container(
                child: detaildata["Products"].length==0?Container(height: 350,width: MediaQuery.of(context).size.width,child: Center(child: Text("لا يوجد عناصر في المتجر"),),) :
                Container(height: 400,width: MediaQuery.of(context).size.width,margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,left: MediaQuery.of(context).size.width*0.01,right: MediaQuery.of(context).size.width*0.01 ,top: MediaQuery.of(context).size.height*0.02),
                  child: Directionality(textDirection: TextDirection.rtl,
                    child: GridView.builder( physics: BouncingScrollPhysics(),scrollDirection: Axis.vertical,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: (180/235),),itemCount: detaildata["Products"].length,itemBuilder: (context,i){
                      return Directionality(textDirection: TextDirection.ltr,
                        child: Container(margin: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black38),color: Colors.white),height: 2000,child: detaildata["Products"][i]["Status"].toString().trim()!= "متاح"
                            ?Container(
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),height: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),child:Stack(
                          children:[ Container(
                            child: Column(children: [
                              Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.25,child: ClipRRect( borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),child: FadeInImage(fit: BoxFit.fill,placeholder: AssetImage("images/logoaz.png"),image: NetworkImage(detaildata["Products"][i]["Photo"]),)),),
                              Container(margin: EdgeInsets.only(top: 5),child: Row(children:[
                                Expanded(child: Container( alignment:Alignment.centerLeft ,margin: EdgeInsets.only(left: 5),child:  Directionality(textDirection: TextDirection.rtl,child:
                                Text(detaildata["Products"][i]["SalePrice"].toString()+"ريال",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(246, 7, 7, 1),fontSize: 12),)),)),
                                Expanded(flex: 2,child: Container(alignment:Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03,bottom: 1),child: Directionality(textDirection: TextDirection.rtl,child: AutoSizeText(detaildata["Products"][i]["Name"].toString(),maxLines: 2,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),))]),)
                            ],),
                          ),Positioned(child:Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20) ,topLeft: Radius.circular(20)),color: Colors.black54,) ,width: MediaQuery.of(context).size.width,height: 170,padding: EdgeInsets.only(left: 50,top: 75,bottom: 75,right: 50),child: Container( decoration: BoxDecoration(color: Colors.red ,borderRadius: BorderRadius.circular(20)),child: Center(child:  AutoSizeText("غير متاح",maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 13),)),)),)],
                        ),
                        ):InkWell(
                          child: Container(child:
                          Column(children: [
                            Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.22,child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),child: FadeInImage(fit: BoxFit.fill,placeholder: AssetImage("images/logoaz.png"),image: NetworkImage(detaildata["Products"][i]["Photo"]),)),),
                            Container( margin: EdgeInsets.only(top: 5),child :
                             Row(children:[
                              Expanded(child: Container( alignment:Alignment.centerLeft ,margin: EdgeInsets.only(left: 5),child:  Directionality(textDirection: TextDirection.rtl,child:
                              Text(detaildata["Products"][i]["SalePrice"].toString()+"ريال",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(246, 7, 7, 1),fontSize: 12),)),)),
                              Expanded(flex: 2,child: Container(alignment:Alignment.centerRight,margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03,bottom: 1),child: Directionality(textDirection: TextDirection.rtl,child: AutoSizeText(detaildata["Products"][i]["Name"].toString(),maxLines: 2,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),))]),
                            ),Spacer(),
                            InkWell(onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return Marasildetail2(detaildata: detaildata ,detailproduct: detaildata["Products"][i],);
                              }));
                            } ,child: Container( height: 30,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20) ),color: Color.fromRGBO(69, 190, 0, 1)) ,margin: EdgeInsets.only()  ,child:  Center(child: AutoSizeText("رؤية التفاصيل",maxLines: 1,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)),)),
                          ],)
                            ,),
                        ),
                        ),
                      );
                    }),
                  ),),
              ),
            )
      ]),
    )));
  }
  navigatetoallreview(rat,id){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Allriviews( id:id,name: detaildata["Name"],photo: detaildata["Photo"],);
    }));
  }
  navigateback(){
    Navigator.of(context).pop();
  }

}