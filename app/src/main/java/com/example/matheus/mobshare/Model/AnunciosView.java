package com.example.matheus.mobshare.Model;

public class AnunciosView {

    private Integer id_anuncio;
    private String locador;
    private String nome_tipo_veiculo;
    private String nome_marca;
    private String nome_modelo;
    private String ano;
    private String placa;
    private String quilometragem;
    private String renava;
    private String descricao;
    private String horario_inicio;
    private String horario_termino;
    private String data_inicil;
    private String data_final;
    private String rua;
    private String bairro;
    private String cidade;
    private String cep;
    private String complemento;
    private String telefone;
    private String celular;
    private String valor_hora;
    private String nome_foto;
    private Float avaliacao;
    private String email;
    private String numero_locacao;



    public Integer getId_anuncio() {
        return id_anuncio;
    }

    public void setId_anuncio(Integer id_anuncio) {
        this.id_anuncio = id_anuncio;
    }

    public String getLocador() {
        return locador;
    }

    public void setLocador(String locador) {
        this.locador = locador;
    }

    public String getNome_tipo_veiculo() {
        return nome_tipo_veiculo;
    }

    public void setNome_tipo_veiculo(String nome_tipo_veiculo) {
        this.nome_tipo_veiculo = nome_tipo_veiculo;
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

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getQuilometragem() {
        return quilometragem;
    }

    public void setQuilometragem(String quilometragem) {
        this.quilometragem = quilometragem;
    }

    public String getRenava() {
        return renava;
    }

    public void setRenava(String renava) {
        this.renava = renava;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getHorario_inicio() {
        return horario_inicio;
    }

    public void setHorario_inicio(String horario_inicio) {
        this.horario_inicio = horario_inicio;
    }

    public String getHorario_termino() {
        return horario_termino;
    }

    public void setHorario_termino(String horario_termino) {
        this.horario_termino = horario_termino;
    }

    public String getData_inicil() {
        return data_inicil;
    }

    public void setData_inicil(String data_inicil) {
        this.data_inicil = data_inicil;
    }

    public String getData_final() {
        return data_final;
    }

    public void setData_final(String data_final) {
        this.data_final = data_final;
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

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
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

    public String getValor_hora() {
        return valor_hora;
    }

    public void setValor_hora(String valor_hora) {
        this.valor_hora = valor_hora;
    }

    public String getNome_foto() {
        return nome_foto;
    }

    public void setNome_foto(String nome_foto) {
        this.nome_foto = nome_foto;
    }

    public Float getAvaliacao() {

        if(avaliacao == null){
            avaliacao = Float.valueOf(0);
        }
        else if(avaliacao > 10){
            avaliacao = Float.valueOf(10);
        }
        return avaliacao;
    }

    public void setAvaliacao(Float avaliacao) {


        this.avaliacao = avaliacao;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumero_locacao() {
        if(numero_locacao == null){
            numero_locacao = "0";
        }
        return numero_locacao;
    }

    public void setNumero_locacao(String numero_locacao) {
        this.numero_locacao = numero_locacao;
    }
}
