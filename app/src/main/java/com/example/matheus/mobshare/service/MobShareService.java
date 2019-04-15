package com.example.matheus.mobshare.service;

import com.example.matheus.mobshare.Model.Anuncio;

import retrofit2.Call;
import retrofit2.http.GET;

public interface MobShareService {

    String URL_BASE = "http://10.0.2.2:5001";

    @GET("/anuncios")
    Call obterAnuncios();
}
