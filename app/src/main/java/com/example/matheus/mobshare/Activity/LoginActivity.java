package com.example.matheus.mobshare.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

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
        Intent intent = new Intent(this, HomeActivity.class);
        startActivity(intent);
    }

}
