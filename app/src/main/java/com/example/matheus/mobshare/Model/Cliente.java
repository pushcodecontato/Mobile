package com.example.matheus.mobshare.Model;

public class Cliente {

    private Integer id_cliente;
    private String nome_cliente;
    private String cpf;
    private String telefone;
    private String celular;

    //MUDAR PARA BITMAP
    private String cnh_foto;
    private String foto_cliente;

    private String rua;
    private String bairro;
    private String cep;
    private String complemento;
    private String cidade;
    private String uf;
    private String emai;
    private String senha;


    public Integer getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(Integer id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCnh_foto() {
        return cnh_foto;
    }

    public void setCnh_foto(String cnh_foto) {
        this.cnh_foto = cnh_foto;
    }

    public String getFoto_cliente() {
        return foto_cliente;
    }

    public void setFoto_cliente(String foto_cliente) {
        this.foto_cliente = foto_cliente;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getEmai() {
        return emai;
    }

    public void setEmai(String emai) {
        this.emai = emai;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
