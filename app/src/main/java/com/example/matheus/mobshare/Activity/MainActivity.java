package com.example.matheus.mobshare.Activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.example.matheus.mobshare.R;

public class MainActivity extends AppCompatActivity {
    HomeActivity activity;

    private SharedPreferences sharedPreferences;
    private SharedPreferences.Editor  editor;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        activity = new HomeActivity();
        sharedPreferences = getSharedPreferences("LOGIN", MODE_PRIVATE);
        editor = sharedPreferences.edit();

        new android.os.Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                verificar_login();
                overridePendingTransition(R.anim.fadein, R.anim.fade_out);

            }
        }, 1500);
    }




    public void verificar_login(){
        if(sharedPreferences.contains("IdCliente")){
            Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
            startActivity(intent);
            finish();
        }
        else{
            Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
            startActivity(intent);
            finish();

        }
    }


}
