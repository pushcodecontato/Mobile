package com.example.matheus.mobshare.view;

import com.example.matheus.mobshare.Model.Notificacao;

import java.util.List;

public interface NotificacaoView {

    void preencherLista(List<Notificacao> notificacao);

    void recarregarTela(String mensagem);

    void statusConfimarcao(Notificacao notificacao);
}
