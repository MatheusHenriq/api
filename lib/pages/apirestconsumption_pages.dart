import 'package:diotwo/models/brands_models.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class ApiRestConsumption extends StatefulWidget {
  @override
  _ApiRestConsumptionState createState() => _ApiRestConsumptionState();
}

class _ApiRestConsumptionState extends State<ApiRestConsumption> {

  Dio _dio;
  final _controller = TextEditingController();
  var _search='';
  var _price='';
  var _name='';
  //List<Brands> _list = [];
  ImageProvider _image = NetworkImage('https://via.placeholder.com/100');
  var _link='';
 

  @override
  void initState(){
    super.initState();
    BaseOptions options = BaseOptions(
      baseUrl: "https://makeup-api.herokuapp.com/api/v1/products.json",
      connectTimeout: 5000,
    );
    _dio = Dio(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('MakeUp API'),
        backgroundColor: Colors.lightBlue,
      ),
      body : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
          child :Column(
            mainAxisAlignment : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children          : <Widget>[
              Text(
                'Type the Brand',
                style: TextStyle(
                  fontSize : 20,
                  fontWeight : FontWeight.bold,
                  color : Colors.green
                ),
              ),
              SizedBox(height:5),
              Container(
                padding: EdgeInsets.all(20),
                child :TextField(
                controller: _controller,                           
              )
              ),

              MaterialButton(
                onPressed : (){
                  getMakeUp();
                },
                color : Colors.green,
                child : Text(
                  'Search',
                  style: TextStyle(
                    fontSize : 16,
                    fontWeight: FontWeight.bold,
                    color : Colors.orange
                  ),
                ),
              
              ),

              SizedBox(
                height : 100,
                width :100,
                child : CircleAvatar(
                  backgroundImage: _image,
                )
              ),
              Text(
                'Name : $_name'
              ),
              Text(
                'Price : $_price'
              ),
              Text(
                'Link : $_link'
              )

            ],
          )
        ),
      
    );
  }

  void getMakeUp() async{
    Response response = await _dio.get('?brand={$_controller}');
    var product = response.data['data'];

   // _list = json.decode(product['brand']).map((data)=> Brands.fromJson(data)).toList();

    setState(() {
      _name = product['name'].toString();
      _price = product['price'].toString();
      _image = NetworkImage(product['image_link']);
      _link = product['product_link'].toString();
    });

    
  }

}