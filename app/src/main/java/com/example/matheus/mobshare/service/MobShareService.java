package com.example.matheus.mobshare.service;

import com.example.matheus.mobshare.Model.AnunciosView;
import com.example.matheus.mobshare.Model.ApiResult;
import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.Model.MarcaVeiculo;
import com.example.matheus.mobshare.Model.ModeloVeiculo;
import com.example.matheus.mobshare.Model.TipoVeiculo;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface MobShareService {

    String URL_BASE = "http://10.0.2.2:5001";
//    String URL_BASE = "http://192.168.43.123:5001";
//    String URL_BASE = "http://192.168.0.107:5001";
    String URL_FOTO =  "http://10.0.2.2";

    @POST("/anuncios")
    Call<List<AnunciosView>> obterAnuncios(@Body ArrayList<String> filtro);

    @GET("/anuncios/{id}")
    Call<List<AnunciosView>> obterAnuncioPorId(@Path("id") int id_anuncio);

    @POST("/register")
    Call<ApiResult> cadastrarCliente(@Body Cliente cliente);

    @POST("/login")
    Call<List<Cliente>> loginCliente(@Body Cliente cliente);

    @GET("/tipoVeiculo")
    Call <List<TipoVeiculo>> carregarSpinnerTipoVeiculo();

    @GET("/tipoVeiculo/marca/{id}")
    Call<List<MarcaVeiculo>> carregarSpinnerMarcaVeiculo(@Path("id") int id_tipo_veiculo);

    @GET("/tipoVeiculo/marca/modelo/{id}")
    Call<List<ModeloVeiculo>> carregarSpinnerModeloVeiculo(@Path("id") int id_marca_veiculo);
}
