package com.example.matheus.mobshare.Activity.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.animation.AnimationUtils;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;

import com.example.matheus.mobshare.R;

public class LoginActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    public void cadastrar_conta(View v){
        Intent intent = new Intent(this, CadatrarActivity.class);
        startActivity(intent);
    }

    public void btnLogar(View v){
        Log.e("OIIIIIIIIII", "FUNFANDO:");
    }

}
