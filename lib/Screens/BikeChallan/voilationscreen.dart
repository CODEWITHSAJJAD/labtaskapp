import 'package:flutter/material.dart';

class VoilationScreen extends StatefulWidget {
  const VoilationScreen({super.key});

  @override
  State<VoilationScreen> createState() => _VoilationScreenState();
}

class _VoilationScreenState extends State<VoilationScreen> {
  bool _isSignalVoilation=false,_isHelmetVoilation=false;
  bool _isNumberPlateVoilation=false,_isSpeedVoilation=false;
  int _voilationCount=0;
  int _challanAmount=0;
  void signalVoilated(bool ? val){ }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bike Challan Mangement'),
      backgroundColor: Colors.blue,),
      body: Padding(padding: EdgeInsets.all(15),
   
      
      child:Column(
        children: [
          Row(
            children: [
              Checkbox(value: _isSignalVoilation, 
                       onChanged: (bool? value){
                        _isSignalVoilation=value!;
                        setState(() {
                          
                        });

                       }
                       
                       ),
              Text('Signal (Fine Rs 400)')
            ],

          ),
          Row(
            children: [
              Checkbox(value: _isHelmetVoilation, 
                       onChanged: (bool? value){
                        _isHelmetVoilation=value!;
                        setState(() {
                          
                        });

                       }
                       
                       ),
              Text('Helmet (Fine Rs 500)')
            ],

          ),
          Row(
            children: [
              Checkbox(value: _isSpeedVoilation, 
                       onChanged: (bool? value){
                        _isSpeedVoilation=value!;
                        setState(() {
                          
                        });

                       }
                       
                       ),
              Text('Speed (Fine Rs 600)')
            ],

          ),
          Row(
            children: [
              Checkbox(value: _isNumberPlateVoilation, 
                       onChanged: (bool? value){
                        _isNumberPlateVoilation=value!;
                        setState(() {
                          
                        });

                       }
                       
                       ),
              Text('Number Plate (Fine Rs 400)')
            ],

          ),
          ElevatedButton(onPressed: (){
            _voilationCount=_challanAmount=0;
            if(_isSignalVoilation){
              _voilationCount++;
              _challanAmount+=400;
            }
            if(_isHelmetVoilation){
              _voilationCount++;
              _challanAmount+=500;
            }
            if(_isNumberPlateVoilation){
              _voilationCount++;
              _challanAmount+=400;
            }
            if(_isSpeedVoilation){
              _voilationCount++;
              _challanAmount+=600;
            }
            setState(() {
              
            });

          }, child: Text('Calcuate',style: TextStyle(fontSize: 20),)),
          Text('Total Voilations:: ${_voilationCount}',style: TextStyle(fontSize: 20)),
           Text('Challan Amount ::  ${_challanAmount}',style: TextStyle(fontSize: 20))

        ],

      ),
      
      
      ),
    );
  }
}