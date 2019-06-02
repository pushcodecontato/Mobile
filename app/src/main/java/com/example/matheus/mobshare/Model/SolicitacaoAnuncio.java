package com.example.matheus.mobshare.Model;

public class SolicitacaoAnuncio {
    private Integer id_anuncio;
    private Integer id_cliente;

    private String data_inicio;
    private String data_final;
    private String hora_inicial;
    private String hora_final;
    private Integer status_solicitacao;
    private Integer id_locacao;

    private AnunciosView anuncio;
    private Cliente cliente;


    public Integer getId_anuncio() {
        return id_anuncio;
    }

    public void setId_anuncio(Integer id_anuncio) {
        this.id_anuncio = id_anuncio;
    }

    public Integer getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(Integer id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getData_inicio() {
        return data_inicio;
    }

    public void setData_inicio(String data_inicio) {
        this.data_inicio = data_inicio;
    }

    public String getData_final() {
        return data_final;
    }

    public void setData_final(String data_final) {
        this.data_final = data_final;
    }

    public String getHora_inicial() {
        return hora_inicial;
    }

    public void setHora_inicial(String hora_inicial) {
        this.hora_inicial = hora_inicial;
    }

    public String getHora_final() {
        return hora_final;
    }

    public void setHora_final(String hora_final) {
        this.hora_final = hora_final;
    }

    public Integer getStatus_solicitacao() {
        return status_solicitacao;
    }

    public void setStatus_solicitacao(Integer status_solicitacao) {
        this.status_solicitacao = status_solicitacao;
    }

    public Integer getId_locacao() {
        return id_locacao;
    }

    public void setId_locacao(Integer id_locacao) {
        this.id_locacao = id_locacao;
    }

    public AnunciosView getAnuncio() {
        return anuncio;
    }

    public void setAnuncio(AnunciosView anuncio) {
        this.anuncio = anuncio;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

}


