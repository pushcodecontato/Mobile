package com.example.matheus.mobshare.service;

import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.Model.AnunciosView;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface MobShareService {

//    String URL_BASE = "http://10.0.2.2:5001";
//    String URL_BASE = "http://192.168.43.123:5001";
    String URL_BASE = "http://192.168.0.107:5001";

    @GET("/anuncios")
    Call<List<AnunciosView>> obterAnuncios();

    @GET("/anuncios/{id}")
    Call<List<AnunciosView>> obterAnuncioPorId(@Path("id") int id_anuncio);

    @POST("/register")
    Call<ApiResult> cadastrarCliente(@Body Cliente cliente);

    @POST("/login")
    Call<List<Cliente>> loginCliente(@Body Cliente cliente);
}
