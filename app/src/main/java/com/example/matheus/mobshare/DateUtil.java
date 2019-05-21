package com.example.matheus.mobshare;

public class DateUtil {

    public int convertToInt(String data){

        String[] dataSlipt = data.split("/");

        String dia = dataSlipt[0];
        String mes = dataSlipt[1];
        String ano = dataSlipt[2];

        String dataFormada = ano + mes + dia;

        return Integer.parseInt(dataFormada);
    };
}
