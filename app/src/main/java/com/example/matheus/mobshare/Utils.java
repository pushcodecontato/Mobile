package com.example.matheus.mobshare;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.ByteArrayOutputStream;

public class Utils {

    public static byte[] toByteArray(Bitmap bitmap){

        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG,0,stream);

        return stream.toByteArray();
    }
    public static Bitmap toBitmap(byte[] bArray){
        return BitmapFactory.decodeByteArray(bArray,0,bArray.length);
    }
}
