package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.LoginView;

import java.util.List;

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
       MobShareService service = ServiceFactoty.create();

       Call<List<Cliente>> call = service.loginCliente(cliente);

       call.enqueue(new Callback<List<Cliente>>() {
           @Override
           public void onResponse(Call<List<Cliente>> call, Response<List<Cliente>> response) {
               List<Cliente> cliente = response.body();
               if(!cliente.isEmpty()){
                   loginView.showMessage(true, "Login efetuado com sucesso.");
                   loginView.salvarDados(cliente);
               }else{
                   Log.d("OIA", "ARROZ");
               }




           }

           @Override
           public void onFailure(Call<List<Cliente>> call, Throwable t) {
               Log.d("OIA", "ARROZ COM FEIJÃO?");
           }
       });
    }

}
