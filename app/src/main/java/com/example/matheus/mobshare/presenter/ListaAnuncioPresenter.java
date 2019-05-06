package com.example.matheus.mobshare.presenter;

import android.util.Log;

import com.example.matheus.mobshare.Model.AnunciosView;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.ListaAnuncioView;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ListaAnuncioPresenter{

    ListaAnuncioView listaAnuncioView;
    MobShareService service;

    public ListaAnuncioPresenter(ListaAnuncioView listaAnuncioView, MobShareService service){
        this.listaAnuncioView = listaAnuncioView;
        this.service = service;
    }

    public void carregarAnuncios(ArrayList<String> filtro){

        MobShareService service = ServiceFactoty.create();

        Call<List<AnunciosView>> call = service.obterAnuncios(filtro);

        call.enqueue(new Callback<List<AnunciosView>>() {
            @Override
            public void onResponse(Call<List<AnunciosView>> call, Response<List<AnunciosView>> response) {
                List<AnunciosView> anuncios = response.body();
                listaAnuncioView.PreencherListaAnuncio(anuncios);
                Log.d("Funcionou ", "Anuncios carregados... eu acho");
            }

            @Override
            public void onFailure(Call<List<AnunciosView>> call, Throwable t) {
                Log.d("ERRO ", "Não foi possivel carregar os anuncios");
                Log.d("ERRO ", String.valueOf(t));
            }
        });




    }
}
