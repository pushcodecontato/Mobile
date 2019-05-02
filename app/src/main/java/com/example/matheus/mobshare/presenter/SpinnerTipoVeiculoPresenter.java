package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.TipoVeiculo;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SpinnerTipoVeiculoPresenter {

    CarregarSpinnersView carregarSpinnersView;
    MobShareService mobShareService;

    public SpinnerTipoVeiculoPresenter(CarregarSpinnersView carregarSpinnersView, MobShareService mobShareService){
        this.mobShareService = mobShareService;
        this.carregarSpinnersView = carregarSpinnersView;
    }

    public void SpinnerTipoVeiculo(){
       MobShareService service = ServiceFactoty.create();

        Call<List<TipoVeiculo>> call =  service.carregarSpinnerTipoVeiculo();

        call.enqueue(new Callback<List<TipoVeiculo>>() {
            @Override
            public void onResponse(Call<List<TipoVeiculo>> call, Response<List<TipoVeiculo>> response) {
                List<TipoVeiculo> tipoVeiculos = response.body();
                carregarSpinnersView.carregarTipoVeiculo(tipoVeiculos);
                Log.d("TESTE DO SPINNER", tipoVeiculos.get(0).getNome_tipo_veiculo());
            }

            @Override
            public void onFailure(Call<List<TipoVeiculo>> call, Throwable t) {
                Log.d("TESTE DO SPINNER ERRO: ", String.valueOf(t));
            }
        });
    }
}
