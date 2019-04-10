package com.example.matheus.mobshare.Activity.activity;

import android.os.Bundle;
import android.support.design.animation.AnimationUtils;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.animation.Animation;

import com.example.matheus.mobshare.R;

public class LoginActivity extends AppCompatActivity {


    Animation fadeIn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        fadeIn = android.view.animation.AnimationUtils.loadAnimation(this, R.anim.fadein);

    }

}
