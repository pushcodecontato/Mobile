package com.example.matheus.mobshare.Model;

public class TipoVeiculo {

    private Integer id;
    private String tipoVeiculo;



    @Override
    public String toString() {
        return getTipoVeiculo();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoVeiculo() {
        return tipoVeiculo;
    }

    public void setTipoVeiculo(String tipoVeiculo) {
        this.tipoVeiculo = tipoVeiculo;
    }
}
