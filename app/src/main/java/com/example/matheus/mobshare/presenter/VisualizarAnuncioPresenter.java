package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.modelView.AnunciosView;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.ListaAnuncioView;
import com.example.matheus.mobshare.view.VisualizarAnuncioView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class VisualizarAnuncioPresenter {

    VisualizarAnuncioView visualizarAnuncioView;
    MobShareService mobShareService;

    public VisualizarAnuncioPresenter(VisualizarAnuncioView visualizarAnuncioView, MobShareService mobShareService){
        this.visualizarAnuncioView = visualizarAnuncioView;
        this.mobShareService = mobShareService;
    }

    public void retonarAnuncio(int id){
        mobShareService.obterAnuncioPorId(id).enqueue(new Callback<List<AnunciosView>>() {
            @Override
            public void onResponse(Call<List<AnunciosView>> call, Response<List<AnunciosView>> response) {
                Log.d("Sucesso", "Anuncio foi carregado com sucesso");
                Log.d("Sucesso", String.valueOf(call));
                Log.d("Sucesso", String.valueOf(response));
                visualizarAnuncioView.CarregarAnuncioPorId(response.body().get(0));

            }

            @Override
            public void onFailure(Call<List<AnunciosView>> call, Throwable t) {
                Log.d("Erro", "Erro! O anuncio não foi carregado");
                Log.d("Erro", String.valueOf(t));
            }
        });
    }
}
