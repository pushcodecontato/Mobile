package com.example.matheus.mobshare.Activity.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.Toast;

import com.example.matheus.mobshare.R;

public class MainActivity extends AppCompatActivity {
Animation animation;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        new android.os.Handler().postDelayed(new Runnable() {
            @Override
            public void run() {

                Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
                startActivity(intent);
                overridePendingTransition(R.anim.fadein, R.anim.fade_out);
                onStop();
            }
        }, 1500);
    }

    public void btnIniciar(View v){
        //Método similar ao setInterval ou setTimeOut

    }


    @Override
    protected void onStop() {
        super.onStop();
    }


}
