package com.example.matheus.mobshare.Model;

public class Notificacao {

    private Integer id_locador;
    private Integer id_anuncio;
    private Integer id_locatario;
    private Integer id_solicitacao_anuncio;
    private Integer status_solicitacao;
    private Integer id_percentual;
    private Float valorLocacao;
    private Float valor_hora;

    private String hora_final;
    private String hora_inicial;
    private String data_final;
    private String data_inicio;
    private String nome_marca;
    private String nome_modelo;
    private String nome_cliente;
    private String foto_cliente;

    public Integer getId_anuncio() {
        return id_anuncio;
    }

    public void setId_anuncio(Integer id_anuncio) {
        this.id_anuncio = id_anuncio;
    }

    public Integer getId_locatario() {
        return id_locatario;
    }

    public void setId_locatario(Integer id_locatario) {
        this.id_locatario = id_locatario;
    }

    public String getHora_final() {
        return hora_final;
    }

    public void setHora_final(String hora_final) {
        this.hora_final = hora_final;
    }

    public String getHora_inicial() {
        return hora_inicial;
    }

    public void setHora_inicial(String hora_inicial) {
        this.hora_inicial = hora_inicial;
    }

    public String getData_final() {
        return data_final;
    }

    public void setData_final(String data_final) {
        this.data_final = data_final;
    }

    public String getData_inicio() {
        return data_inicio;
    }

    public void setData_inicio(String data_inicio) {
        this.data_inicio = data_inicio;
    }

    public String getNome_marca() {
        return nome_marca;
    }

    public void setNome_marca(String nome_marca) {
        this.nome_marca = nome_marca;
    }

    public String getNome_modelo() {
        return nome_modelo;
    }

    public void setNome_modelo(String nome_modelo) {
        this.nome_modelo = nome_modelo;
    }

    public Integer getStatus_solicitacao() {
        return status_solicitacao;
    }

    public void setStatus_solicitacao(Integer status_solicitacao) {
        this.status_solicitacao = status_solicitacao;
    }

    public String getFoto_cliente() {
        return foto_cliente;
    }

    public void setFoto_cliente(String foto_cliente) {
        this.foto_cliente = foto_cliente;
    }

    public Integer getId_locador() {
        return id_locador;
    }

    public void setId_locador(Integer id_locador) {
        this.id_locador = id_locador;
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public Integer getId_solicitacao_anuncio() {
        return id_solicitacao_anuncio;
    }

    public void setId_solicitacao_anuncio(Integer id_solicitacao_anuncio) {
        this.id_solicitacao_anuncio = id_solicitacao_anuncio;
    }

    public Integer getId_percentual() {
        return id_percentual;
    }

    public void setId_percentual(Integer id_percentual) {
        this.id_percentual = id_percentual;
    }

    public Float getValorLocacao() {
        return valorLocacao;
    }

    public void setValorLocacao(Float valorLocacao) {
        this.valorLocacao = valorLocacao;
    }

    public Float getValor_hora() {
        return valor_hora;
    }

    public void setValor_hora(Float valor_hora) {
        this.valor_hora = valor_hora;
    }
}
