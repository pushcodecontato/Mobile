package com.example.matheus.mobshare.view;

import com.example.matheus.mobshare.Model.MarcaVeiculo;
import com.example.matheus.mobshare.Model.TipoVeiculo;

import java.util.List;

public interface CarregarSpinnersView {

    void carregarTipoVeiculo(List<TipoVeiculo> tipoVeiculo);

    void carregarMarcaVeiculo(List<MarcaVeiculo> marcaVeiculo);

}
