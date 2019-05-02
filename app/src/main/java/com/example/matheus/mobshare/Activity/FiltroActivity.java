package com.example.matheus.mobshare.Activity;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.matheus.mobshare.Model.TipoVeiculo;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.SpinnerTipoVeiculoPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import java.util.List;

public class FiltroActivity extends AppCompatActivity implements CarregarSpinnersView{

    Spinner spTipoVeiculo;
    MobShareService service = ServiceFactoty.create();
    SpinnerTipoVeiculoPresenter presenter;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.filtro_layout);

        spTipoVeiculo = (Spinner) findViewById(R.id.spTipoVeiculo);

        presenter = new SpinnerTipoVeiculoPresenter(this,service);

        presenter.SpinnerTipoVeiculo();
    }

    @Override
    public void carregarTipoVeiculo(ArrayAdapter<TipoVeiculo> tipoVeiculo) {
        ArrayAdapter<TipoVeiculo> arrayAdapter = new ArrayAdapter<TipoVeiculo>(this, R.layout.support_simple_spinner_dropdown_item, (List<TipoVeiculo>) tipoVeiculo);

        arrayAdapter.setDropDownViewResource(R.layout.support_simple_spinner_dropdown_item);

        spTipoVeiculo.setAdapter(arrayAdapter);
        spTipoVeiculo.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                preencheSpinner();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }


    public void preencheSpinner(){
        String nome = (String)spTipoVeiculo.getSelectedItem();
        long id = spTipoVeiculo.getSelectedItemId();
        int position = spTipoVeiculo.getSelectedItemPosition();

        Toast.makeText(this, nome,Toast.LENGTH_LONG).show();
    }
}
