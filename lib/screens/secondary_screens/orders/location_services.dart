import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/backEndPe/all_Bloc/blocs/orders_bloc.dart';
import 'package:taif/backEndPe/repository/orders_repostory.dart';

class LocationServices extends StatefulWidget {
  const LocationServices({Key? key}) : super(key: key);

  @override
  _LocationServicesState createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {
  @override
  Widget build(BuildContext context) {
    return  no2();
  }


  Widget no2(){
    return BlocProvider(
      create: (context)=>OrdersBloc(OrderRepostoryImpl())..add(getOrdersLocationServicesEvent()),
      child: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = EstatesCubit.get(context).myEstateModel;

          print(state);
          if(state is OrderLocationServiceStateLoaded){
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.dataOrderlocationServices.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        '${state.dataOrderlocationServices.data?[index].title??""}',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 18.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),



                      dataRow(title: "	القسم",des:'${state.dataOrderlocationServices.data![index].category?.name??""}' ),
                      SizedBox(
                        height: 4,
                      ),
                      dataRow(title: "		الحالة",des:
                      state.dataOrderlocationServices.data![index].status=="pending"?"قيد الانتظار":
                      state.dataOrderlocationServices.data![index].status=="accepted"?"تم الموافقه":
                      state.dataOrderlocationServices.data![index].status=="refused"?"تم الرفض":
                      '${state.dataOrderlocationServices.data![index].status}' ),





                      SizedBox(
                        height: 10,
                      ),
                      Divider(thickness: 2,),

                    ],
                  ) ;
                });
          }else if(state is OrdersStateError){
            return Center(
              child:Text(state.massageError),
            );
          }else{
            return SizedBox(
              height: MediaQuery.of(context).size.width,
              child: Center(
                child:CircularProgressIndicator(),
              ),
            );
          }

        },
      ),
    );
  }


  dataRow({title,des}){
    return Row(
      children: [

        Expanded(
          flex: 1,
          child:
          Text(
            '$title ',
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 18.sp,
              color: const Color(0xff003e4f),
            ),
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(height: 15,),

        Expanded(
          flex: 2,
          child:
          Text(
            '$des',
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 14.sp,
              color: const Color(0xff003e4f),
            ),
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

        ),

      ],
    );
  }

}
