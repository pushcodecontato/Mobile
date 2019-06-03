package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.Andamento;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.VisualizarAndamentoView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class VisualizarAndamentoPresenter {

    MobShareService mobShareService;
    VisualizarAndamentoView visualizarAndamentoView;

    public VisualizarAndamentoPresenter(MobShareService mobShareService, VisualizarAndamentoView visualizarAndamentoView){
        this.mobShareService = mobShareService;
        this.visualizarAndamentoView = visualizarAndamentoView;
    }
    public void mostrarNotificacoes(int id_locacao){
        mobShareService.visualizarAndamentos(id_locacao).enqueue(new Callback<List<Andamento>>() {
            @Override
            public void onResponse(Call<List<Andamento>> call, Response<List<Andamento>> response) {
                visualizarAndamentoView.carregarAndamendo(response.body().get(0));
            }

            @Override
            public void onFailure(Call<List<Andamento>> call, Throwable t) {
                Log.d("ERRO: ", String.valueOf(t));
            }
        });
    }
}
