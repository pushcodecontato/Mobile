package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.Andamento;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.AndamentoView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class AndamentoPresenter {

    MobShareService mobShareService;
    AndamentoView andamentoView;

    public AndamentoPresenter(MobShareService mobShareService, AndamentoView andamentoView){
        this.mobShareService = mobShareService;
        this.andamentoView = andamentoView;
    }
    public void mostrarNotificacoes(int id_locador){
        MobShareService service = ServiceFactoty.create();

        Call<List<Andamento>> call = service.obterAndamentos(id_locador);

        call.enqueue(new Callback<List<Andamento>>() {
            @Override
            public void onResponse(Call<List<Andamento>> call, Response<List<Andamento>> response) {
                List<Andamento> andamentos = response.body();
                Log.d("RESPOSTA: ", "Anuncios em andamento carregados com sucesso.");
                andamentoView.carregarAndamentos(andamentos);
            }

            @Override
            public void onFailure(Call<List<Andamento>> call, Throwable t) {
                Log.e("RESPOSTA: ", "Anuncios em andamento não foram carregados carregados.");
                Log.e("ERRO: ", String.valueOf(t));
            }
        });
    }
}
