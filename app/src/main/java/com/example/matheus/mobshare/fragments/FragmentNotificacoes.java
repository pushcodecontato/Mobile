package com.example.matheus.mobshare.fragments;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.Toast;

import com.example.matheus.mobshare.Activity.HomeActivity;
import com.example.matheus.mobshare.Model.Notificacao;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.NotificacoesAdapter;
import com.example.matheus.mobshare.presenter.NotificacaoPresenter;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.NotificacaoView;

import java.util.List;

public class FragmentNotificacoes extends Fragment implements NotificacaoView {

    NotificacoesAdapter notificacoesAdapter;
    HomeActivity homeActivity;
    ListView lstNotificacao;
    NotificacaoPresenter presenter;
    SharedPreferences sharedPreferences;
    int id_locador;

    public FragmentNotificacoes(){}

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View v = inflater.inflate(R.layout.fragment_notificacoes, container, false);

        lstNotificacao = v.findViewById(R.id.lstNotificacoes);
        presenter = new NotificacaoPresenter(ServiceFactoty.create(), this);

        notificacoesAdapter = new NotificacoesAdapter(getContext(), this, presenter);
        lstNotificacao.setAdapter(notificacoesAdapter);
        sharedPreferences = getActivity().getSharedPreferences("LOGIN", Context.MODE_PRIVATE);
        id_locador = sharedPreferences.getInt("IdCliente", 0);


        presenter.mostrarNotificacoes(id_locador);
        return v;
    }

    @Override
    public void preencherLista(List<Notificacao> notificacao) {
        notificacoesAdapter.clear();
        notificacoesAdapter.addAll(notificacao);
    }

    @Override
    public void recarregarTela(String mensagem) {
        presenter.mostrarNotificacoes(id_locador);
        Toast.makeText(getContext(), mensagem, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void statusConfimarcao(Notificacao notificacao) {

    }
}
