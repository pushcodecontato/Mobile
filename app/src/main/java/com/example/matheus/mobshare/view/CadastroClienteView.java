package com.example.matheus.mobshare.view;

public interface CadastroClienteView {

    void showMessageSucesso(String titulo, String mensagem, String aviso);

    void showMessageFailed(String titulo, String mensagem);

    void exibirProgresso();
    void escoderProgresso();

}
