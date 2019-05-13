package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.MeusVeiculos;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.MeusVeiculosView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MeusVeiculosPresenter {

    MeusVeiculosView meusVeiculosView;
    MobShareService mobShareService;

    public MeusVeiculosPresenter(MeusVeiculosView meusVeiculosView, MobShareService mobShareService){
        this.meusVeiculosView = meusVeiculosView;
        this.mobShareService = mobShareService;
    }

    public void retornarVeiculos(int id){
        mobShareService.obterVeiculos(id).enqueue(new Callback<List<MeusVeiculos>>() {
            @Override
            public void onResponse(Call<List<MeusVeiculos>> call, Response<List<MeusVeiculos>> response) {
                List<MeusVeiculos> meusVeiculos = response.body();
                Log.d("TESTE: ", "CARREGANDO VEICULOS");
                meusVeiculosView.carregarMeusVeiculos(meusVeiculos);
            }

            @Override
            public void onFailure(Call<List<MeusVeiculos>> call, Throwable t) {
                Log.d("TESTE: ", "VEICULOS NÃO CARREGADOS");
                Log.d("ERRO: ", String.valueOf(t));
            }
        });
    }
}
