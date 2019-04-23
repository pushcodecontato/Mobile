package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.CadastroClienteView;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CadastroClientePresenter {

    CadastroClienteView cadastroClienteView;
    MobShareService mobShareService;

    public CadastroClientePresenter(CadastroClienteView cadastroClienteView, MobShareService mobShareService){
        this.cadastroClienteView = cadastroClienteView;
        this.mobShareService = mobShareService;
    }
    public void CadastroClientePresenter(Cliente cliente){
        mobShareService.cadastrarCliente(cliente).enqueue(new Callback<ApiResult>() {
            @Override
            public void onResponse(Call<ApiResult> call, Response<ApiResult> response) {
                ApiResult result = response.body();
                if(result.isSucesso()){
                    Log.d("Sucesso", result.getMensagem() + result.getAviso());
                    cadastroClienteView.showMessageSucesso("Sucesso", result.getMensagem(), result.getAviso());
                }
                else{
                    Log.d("Erro", result.getMensagem() + result.getAviso());
                    cadastroClienteView.showMessageFailed("Erro", result.getMensagem());
                }
            }

            @Override
            public void onFailure(Call<ApiResult> call, Throwable t) {
                cadastroClienteView.showMessageFailed("Erro", t.getMessage());
                t.printStackTrace();
            }
        });
    }
}
