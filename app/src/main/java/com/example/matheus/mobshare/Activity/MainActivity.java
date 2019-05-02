package com.example.matheus.mobshare.Activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.Toast;

import com.example.matheus.mobshare.R;

public class MainActivity extends AppCompatActivity {
    private SharedPreferences sharedPreferences;
    private SharedPreferences.Editor  editor;

@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        sharedPreferences = getSharedPreferences("LOGIN", MODE_PRIVATE);
        editor = sharedPreferences.edit();

        new android.os.Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                verificar_login();
                overridePendingTransition(R.anim.fadein, R.anim.fade_out);
                onStop();
            }
        }, 1500);
    }


    @Override
    protected void onStop() {
        super.onStop();
    }

    public void verificar_login(){
        if(sharedPreferences.contains("IdCliente")){
            Log.d("TESTE: ", "HOMEACTIVITY");
            Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
            startActivity(intent);
            finish();
        }
        else{
            Log.d("TESTE: ", "LOGINACTIVITY" +
                    "");
            Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
            startActivity(intent);
            finish();
        }
    }


}
