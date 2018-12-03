library mask_shifter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaskedTextInputFormatterShifter extends TextInputFormatter {
  String maskONE;
  String maskTWO;

  MaskedTextInputFormatterShifter({this.maskONE, this.maskTWO}) {
    assert(maskONE != null);
    assert(maskTWO != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > maskTWO.length) return oldValue;

        if (newValue.text.length <= maskONE.length && (maskONE[newValue.text.length - 1] != "X") && newValue.text.length != oldValue.text.length) {
          if (maskONE[newValue.text.length - 1] != "X") {
            return TextEditingValue(
              text: '${oldValue.text}' + maskONE[newValue.text.length - 1] + '${newValue.text.substring(newValue.text.length - 1)}',
              selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1,
              ),
            );
          }
        } else if (newValue.text.length > maskONE.length) {
          String TWO = "";

          if (oldValue.text.length == maskONE.length) {
            newValue.text.runes.forEach((int rune) {
              var character = new String.fromCharCode(rune);
              if (character != "." && character != "-" && character != "/") {
                TWO = TWO + character;
                if (maskTWO[TWO.length] != "X") {
                  TWO = '$TWO' + maskTWO[TWO.length];
                }
              }
            });

            return TextEditingValue(
              text: '$TWO',
              selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1,
              ),
            );
          }
        }
      } else if (oldValue.text.length > newValue.text.length) {
        if (oldValue.text.length == (maskONE.length + 1)) {
          String ONE = "";
          newValue.text.runes.forEach((int rune) {
            var character = new String.fromCharCode(rune);
            if (character != "." && character != "-" && character != "/") {
              ONE = ONE + character;
              try{
                if (maskONE[ONE.length] != "X") {
                  ONE = '$ONE' + maskONE[ONE.length];
                }
              }
              catch(Exception){

              }

            }
          });
          return TextEditingValue(
            text: '$ONE',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end,
            ),
          );
        }
      }
    }
    return newValue;
  }
}