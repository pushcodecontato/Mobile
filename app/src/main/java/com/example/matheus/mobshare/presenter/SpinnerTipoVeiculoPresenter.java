package com.example.matheus.mobshare.presenter;

import android.util.Log;
import android.widget.ArrayAdapter;

import com.example.matheus.mobshare.Model.TipoVeiculo;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SpinnerTipoVeiculoPresenter {

    CarregarSpinnersView carregarSpinnersView;
    MobShareService mobShareService;

    public SpinnerTipoVeiculoPresenter(CarregarSpinnersView carregarSpinnersView, MobShareService mobShareService){
        this.mobShareService = mobShareService;
        this.carregarSpinnersView = carregarSpinnersView;
    }

    public void SpinnerTipoVeiculo(){
       MobShareService service = ServiceFactoty.create();

       Call<ArrayAdapter<TipoVeiculo>> call = service.carregarSpinnerTipoVeiculo();

       call.enqueue(new Callback<ArrayAdapter<TipoVeiculo>>() {
           @Override
           public void onResponse(Call<ArrayAdapter<TipoVeiculo>> call, Response<ArrayAdapter<TipoVeiculo>> response) {
               ArrayAdapter<TipoVeiculo> tipoVeiculo = response.body();
               carregarSpinnersView.carregarTipoVeiculo(tipoVeiculo);
               Log.d("TESTE: ", "Tipos de veiculos carregados");
           }

           @Override
           public void onFailure(Call<ArrayAdapter<TipoVeiculo>> call, Throwable t) {
               Log.d("TESTE: ", "Tipos de veiculos carregados");
               Log.d("ERRO2: ", String.valueOf(t));
           }

       });
    }
}
