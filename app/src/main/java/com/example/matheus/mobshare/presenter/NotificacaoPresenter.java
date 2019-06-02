package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.Notificacao;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.NotificacaoView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class NotificacaoPresenter {

    MobShareService mobShareService;
    NotificacaoView notificacaoView;

    public NotificacaoPresenter(MobShareService mobShareService, NotificacaoView notificacaoView){
        this.mobShareService = mobShareService;
        this.notificacaoView = notificacaoView;
    }
    public void mostrarNotificacoes(int id_locador){
        MobShareService service = ServiceFactoty.create();

        Call<List<Notificacao>> call = service.notificacaoView(id_locador);

        call.enqueue(new Callback<List<Notificacao>>() {
            @Override
            public void onResponse(Call<List<Notificacao>> call, Response<List<Notificacao>> response) {
                List<Notificacao> notificacoes = response.body();
                notificacaoView.preencherLista(notificacoes);
            }

            @Override
            public void onFailure(Call<List<Notificacao>> call, Throwable t) {
                Log.e("ERRO: ", String.valueOf(t));
            }
        });
    }

    public void confirmarSolicitacao(Notificacao notificacao){
        mobShareService.confirmarSolicitacao(notificacao).enqueue(new Callback<ApiResult>() {
            @Override
            public void onResponse(Call<ApiResult> call, Response<ApiResult> response) {
                ApiResult result = response.body();
                notificacaoView.recarregarTela(result.getMensagem());
            }

            @Override
            public void onFailure(Call<ApiResult> call, Throwable t) {
                Log.d("ERRO", String.valueOf(t));
                notificacaoView.recarregarTela("Erro, tente novamente mais tarde!");
            }
        });
    }
}
