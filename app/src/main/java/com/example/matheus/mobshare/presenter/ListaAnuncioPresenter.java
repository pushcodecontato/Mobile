package com.example.matheus.mobshare.presenter;

import android.telecom.Call;

import com.example.matheus.mobshare.Model.Anuncio;
import com.example.matheus.mobshare.modelView.AnunciosView;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.ListaAnuncioView;

import java.util.List;

public class ListaAnuncioPresenter{

    ListaAnuncioView listaAnuncioView;
    MobShareService service;

    public ListaAnuncioPresenter(ListaAnuncioView listaAnuncioView, MobShareService service){
        this.listaAnuncioView = listaAnuncioView;
        this.service = service;
    }

    public void carregarAnuncios(){

        MobShareService service = ServiceFactoty.create();

        Call<List<AnunciosView>> call = service.obterAnuncios();



    }
}
