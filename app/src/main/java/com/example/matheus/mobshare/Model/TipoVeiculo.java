package com.example.matheus.mobshare.Model;

public class TipoVeiculo {

    private Integer id_tipo_veiculo;
    private String nome_tipo_veiculo;



    @Override
    public String toString() {
        return getNome_tipo_veiculo();
    }

    public Integer getId_tipo_veiculo() {
        return id_tipo_veiculo;
    }

    public void setId_tipo_veiculo(Integer id_tipo_veiculo) {
        this.id_tipo_veiculo = id_tipo_veiculo;
    }

    public String getNome_tipo_veiculo() {
        return nome_tipo_veiculo;
    }

    public void setNome_tipo_veiculo(String nome_tipo_veiculo) {
        this.nome_tipo_veiculo = nome_tipo_veiculo;
    }
}
