package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.MarcaVeiculo;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SpinnerMarcaPresenter {

    MobShareService mobShareService;
    CarregarSpinnersView carregarSpinnersView;

    public SpinnerMarcaPresenter(CarregarSpinnersView carregarSpinnersView, MobShareService mobShareService){
        this.carregarSpinnersView = carregarSpinnersView;
        this.mobShareService = mobShareService;
    }

    public void retornarMarca(int id){
        MobShareService service = ServiceFactoty.create();

        Call<List<MarcaVeiculo>> call = service.carregarSpinnerMarcaVeiculo(id);

        call.enqueue(new Callback<List<MarcaVeiculo>>() {
            @Override
            public void onResponse(Call<List<MarcaVeiculo>> call, Response<List<MarcaVeiculo>> response) {
                List<MarcaVeiculo> marcaVeiculos = response.body();
                carregarSpinnersView.carregarMarcaVeiculo(marcaVeiculos);
                Log.d("AVISO: ", "ITENS CARREGADOS COM SUCESSO");
            }

            @Override
            public void onFailure(Call<List<MarcaVeiculo>> call, Throwable t) {
                Log.d("AVISO: ", "ERRO AO CARREGAR ITENS");
                Log.d("AVISO DE ERRO MARCA: ", String.valueOf(t));
            }
        });
    }
}
