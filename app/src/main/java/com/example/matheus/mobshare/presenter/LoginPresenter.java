package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.LoginView;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class LoginPresenter {

    LoginView loginView;
    MobShareService mobShareService;

    public LoginPresenter(LoginView loginView, MobShareService mobShareService){
        this.loginView = loginView;
        this.mobShareService = mobShareService;
    }
    public void LoginPresenter(Cliente cliente){
        mobShareService.loginCliente(cliente).enqueue(new Callback<ApiResult>() {
            @Override
            public void onResponse(Call<ApiResult> call, Response<ApiResult> response) {
                ApiResult result = response.body();
                if(result.isSucesso()){
                    loginView.showMessage(true,"Login efetuado com sucesso");

                }
                else{

                    loginView.showMessage(false,"Falha");

                }
            }

            @Override
            public void onFailure(Call<ApiResult> call, Throwable t) {
                Log.d("ERRO", t.getMessage());
                t.printStackTrace();
            }
        });
    }

}
