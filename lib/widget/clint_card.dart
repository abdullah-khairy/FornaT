  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/cloude_firestore.dart';

import '../classat_and_variable/my_variably.dart';

  class ClintCard extends StatefulWidget {
   ClintCard({super.key,this.name,this.uid ,this.child, this.history,this.onTap,this.userOption,});
   String? name,uid;
   int?child;
   List? history;
Function()? onTap,userOption;

  @override
  State<ClintCard> createState() => _ClintCardState();
}

class _ClintCardState extends State<ClintCard> {
     TextEditingController _value=TextEditingController();
 GlobalKey <FormState> _formstate=new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    dynamic total =widget.child!*5*30;
    dynamic monyall =total*.25;
    return   // المعلومات
                 Container(
                  clipBehavior: Clip.antiAlias,
                             padding:const EdgeInsets.all(16),
                             margin:const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                             decoration: BoxDecoration(
                               color: Colors.black54,
                               borderRadius: BorderRadius.circular(15),
                             ),
                             child: InkWell(
                              onTap: widget.onTap,
                               child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                              Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            userNoleg('name',widget.name),
                            IconButton(onPressed:widget.userOption, icon:const Icon(Icons.menu,color: Colors.white,))
                          ],
                        ),
                        userNoleg('child',widget.child.toString()),
                        userNoleg('total','$total'),
                        StreamBuilder(
                          stream:cardUsers.doc(widget.uid).snapshots(),
                          builder: (context, snapshot) {
                             if (ConnectionState==ConnectionState.waiting) {
                      return  Center(child: Text('loding..',style: textStyle1,),);
                    }
                                 List history=   snapshot.data!.get('history');
                                           bool  tackcard=snapshot.data!.get('tackcard');            

                                 if (history.isEmpty) {
                                     return Column(children: [
                                           
                        userNoleg('mony','$monyall  LE'),
                         Form(
                          key: _formstate,
                          child: TextFormField( 
                            readOnly: tackcard,
                             validator: (value) {
                             if (value!.length>6) {
                               return 'numper can`t to be larger than 6 letter';
                               }  if (value.length<1) {
                                return 'numper can`t to be less than 1 letter';
                                }return null;
                                 },
                            keyboardType: TextInputType.number,
                                    style: textStyle6,
                                    controller: _value,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: (){
                                         var formData=_formstate.currentState;
                                        if (formData!.validate() ) {
                                        formData.save();
                                        List NewValue=[{
                                          'date':dateTimeNow,
                                          'value':int.parse(_value.text)
                                        }];
                                        snapshot.data!.reference.update({
                                          'history':FieldValue.arrayUnion(NewValue)
                                        }).whenComplete(() => _value.clear());
                                  } }, icon:const Icon(Icons.send,color: Colors.blue,)),
                                      hintText:tackcard?'No card': 'today order',
                                      hintStyle:tackcard?textStyle7: textStyle6,
                                    ),
                                   
                                  ),
                        ),
                          ],);}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              List <int> allMyvalue=[];
                                 history.forEach((element) => allMyvalue.add(element['value']),);
                              var import =allMyvalue.reduce((value, element) => value+element);
                              var have =total-import;
                          return Column(children: [
                        userNoleg('import','$import'),
                        userNoleg('have','$have'),                        
                        userNoleg('mony','${have*.25}  LE'),
                        Form(
                          key: _formstate,
                          child: TextFormField( 
                                                        readOnly: tackcard,

                             validator: (value) {
                             if (value!.length>6) {
                               return 'numper can`t to be larger than 6 letter';
                               }  if (value.length<1) {
                                return 'numper can`t to be less than 1 letter';
                                }return null;
                                 },
                            keyboardType: TextInputType.number,
                                    style: textStyle6,
                                    controller: _value,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: (){
                                         var formData=_formstate.currentState;
                                        if (formData!.validate() ) {
                                        formData.save();
                                        List NewValue=[{
                                          'date':dateTimeNow,
                                          'value':int.parse(_value.text)
                                        }];
                                        snapshot.data!.reference.update({
                                          'history':FieldValue.arrayUnion(NewValue)
                                        }).whenComplete(() => _value.clear());
                                  } }, icon:const Icon(Icons.send,color: Colors.blue,)),
                                      hintText: 'today order',
                                      hintStyle:tackcard?textStyle7: textStyle6,
                                    ),
                                   
                                  ),
                        ),
                        
                                                     
                                               
                          ],);
                        },),
                       
                      ],),) )
               ;
  }

   Row userNoleg(key,value) {
    return Row(
      children: [ Text(
    '$key:',
     style: textStyle3,
                            ),
    const   SizedBox(width: 30,),
        Text(
                           value,
                            style: textStyle6,
                          ),
      ],
    );
  }
}