package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.SolicitacaoAnuncio;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.SolicitarAnuncioView;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SolicitarAnuncioPresenter {

    MobShareService mobShareService;
    SolicitarAnuncioView solicitarAnuncioView;

    public SolicitarAnuncioPresenter(SolicitarAnuncioView solicitarAnuncioView,MobShareService mobShareService){
        this.solicitarAnuncioView = solicitarAnuncioView;
        this.mobShareService = mobShareService;
    }

    public void SolicitarAnuncio(final SolicitacaoAnuncio solicitacaoAnuncio){
        mobShareService.solicitarAnuncio(solicitacaoAnuncio).enqueue(new Callback<ApiResult>() {
            @Override
            public void onResponse(Call<ApiResult> call, Response<ApiResult> response) {
                ApiResult result = response.body();
                solicitarAnuncioView.solicitarAnuncioSucesso(result.getMensagem());
            }

            @Override
            public void onFailure(Call<ApiResult> call, Throwable t) {
                Log.e("ERRO: ", String.valueOf(t));
                solicitarAnuncioView.solicitarAnuncioFracasso("Ocorreu uma falha na sua solicitação, tente mais tarde!");
            }
        });
    }
}
