package com.example.matheus.mobshare.Activity;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.widget.Spinner;

import com.example.matheus.mobshare.R;

public class FiltroActivity extends AppCompatActivity {

    private Spinner spTipoVeiculo;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.filtro_layout);

        spTipoVeiculo = (Spinner) findViewById(R.id.spTipoVeiculo);

    }
}
