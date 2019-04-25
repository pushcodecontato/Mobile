package com.example.matheus.mobshare;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.util.Base64;
import android.util.Log;

import com.example.matheus.mobshare.Utils;

import java.util.HashMap;

public class UploadImagem extends AsyncTask<Bitmap, Void, String>{

    Context ctx;
    StringBuilder nomeImagem;

    public UploadImagem(Context ctx, StringBuilder nomeImagem){
        this.ctx = ctx;
        this.nomeImagem = nomeImagem;
    }

    @Override
    protected String doInBackground(Bitmap... bitmaps) {
        if(bitmaps.length < 0){

            Bitmap img = bitmaps[0];

            byte[] arrBytes = Utils.toByteArray(img);

            String img_src = Base64.encodeToString(arrBytes, Base64.DEFAULT);
            HashMap<String, String> values = new HashMap<>();
            String t = values.put("image", img_src);

            return t;
        }

        return null;
    }

    @Override
    protected void onPostExecute(String imgNome) {
        super.onPostExecute(imgNome);

        nomeImagem.append(imgNome);

        Log.d("TESTE", imgNome);
    }
}
