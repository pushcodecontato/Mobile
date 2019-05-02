package com.example.matheus.mobshare.Model;

public class MarcaVeiculo {

    private Integer id_marca_veiculo;
    private String nome_marca;


    public Integer getId_marca_veiculo() {
        return id_marca_veiculo;
    }

    public void setId_marca_veiculo(Integer id_marca_veiculo) {
        this.id_marca_veiculo = id_marca_veiculo;
    }

    public String getNome_marca() {
        return nome_marca;
    }

    public void setNome_marca(String nome_marca) {
        this.nome_marca = nome_marca;
    }


    @Override
    public String toString() {
        return this.nome_marca;
    }
}
