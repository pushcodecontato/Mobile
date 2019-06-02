package com.example.matheus.mobshare;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

    public int convertToInt(String data){

        String[] dataSlipt = data.split("/");

        String dia = dataSlipt[0];
        String mes = dataSlipt[1];
        String ano = dataSlipt[2];

        String dataFormada = ano + mes + dia;

        return Integer.parseInt(dataFormada);
    };

    public String convertToBr(String data){

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.getDefault());

        Date dataEntrada = null;

        try {
            dataEntrada = format.parse(data);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String dataFormada = new SimpleDateFormat("dd/MM/yyyy").format(dataEntrada);

        return dataFormada;
    };
}
