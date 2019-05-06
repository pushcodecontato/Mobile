package com.example.matheus.mobshare.presenter;

import com.example.matheus.mobshare.Model.ModeloVeiculo;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SpinnerModeloVeiculoPresenter {

    CarregarSpinnersView carregarSpinnersView;
    MobShareService mobShareService;

    public SpinnerModeloVeiculoPresenter(CarregarSpinnersView carregarSpinnersView, MobShareService mobShareService){
        this.mobShareService = mobShareService;
        this.carregarSpinnersView = carregarSpinnersView;
    }

    public void SpinnerModeloVeiculo(Integer id){
        MobShareService service = ServiceFactoty.create();

        Call<List<ModeloVeiculo>> call = service.carregarSpinnerModeloVeiculo(id);
        call.enqueue(new Callback<List<ModeloVeiculo>>() {
            @Override
            public void onResponse(Call<List<ModeloVeiculo>> call, Response<List<ModeloVeiculo>> response) {
                List<ModeloVeiculo> modeloVeiculos = response.body();
                carregarSpinnersView.carregarModeloVeiculo(modeloVeiculos);
            }

            @Override
            public void onFailure(Call<List<ModeloVeiculo>> call, Throwable t) {

            }
        });
    }
}
