package com.example.matheus.mobshare.Model;

public class ModeloVeiculo {

    private Integer id_modelo;
    private String nome_modelo;


    public Integer getId_modelo() {
        return id_modelo;
    }

    public void setId_modelo(Integer id_modelo) {
        this.id_modelo = id_modelo;
    }

    public String getNome_modelo() {
        return nome_modelo;
    }

    public void setNome_modelo(String nome_modelo) {
        this.nome_modelo = nome_modelo;
    }
    @Override
    public String toString() {
        return this.nome_modelo;
    }

}
