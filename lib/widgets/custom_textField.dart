import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final Icon icon;
  final Padding suffix;

  const CustomTextField(
      {Key key, @required this.hintText, this.label, this.icon, this.suffix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 33,
                color: Color(0xFFD3D3D3).withOpacity(.25))
          ]),
      height: 75,
      child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: icon),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      label,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: hintText,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          if(suffix != null) Expanded(flex: 1, child: suffix)
        ],
      ),
    );
  }
}
