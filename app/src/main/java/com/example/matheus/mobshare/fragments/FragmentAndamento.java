package com.example.matheus.mobshare.fragments;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import com.example.matheus.mobshare.Activity.HomeActivity;
import com.example.matheus.mobshare.Model.Andamento;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.AndamentoAdapter;
import com.example.matheus.mobshare.presenter.AndamentoPresenter;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.AndamentoView;

import java.util.List;

public class FragmentAndamento extends Fragment implements AdapterView.OnItemClickListener, AndamentoView {

    static String tag = "FragmentAndamento";

    ListView lstAndamento;
    AndamentoAdapter andamentoAdapter;
    AndamentoPresenter presenter;
    private SharedPreferences sharedPreferences;
    private int id_locador;
    HomeActivity activity;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_andamento, container, false );

        sharedPreferences = getActivity().getSharedPreferences("LOGIN", Context.MODE_PRIVATE);
        id_locador = sharedPreferences.getInt("IdCliente", 0);
        lstAndamento =  v.findViewById(R.id.lstAndamento);
        andamentoAdapter = new AndamentoAdapter(getContext());

        lstAndamento.setAdapter(andamentoAdapter);
        lstAndamento.setOnItemClickListener(this);
        activity = (HomeActivity) getActivity();
        presenter = new AndamentoPresenter(ServiceFactoty.create(), this);
        presenter.mostrarNotificacoes(id_locador);
        return v;
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Bundle bundle = new Bundle();
        Andamento andamento = andamentoAdapter.getItem(position);
        FragmentManager fm = getFragmentManager();
        Fragment fragment = new FragmentIniciarAndamento();

        bundle.putInt("id_locacao", andamento.getId_locacao());
        fragment.setArguments(bundle);

        activity.navegarFragment(fragment, tag);
    }


    @Override
    public void carregarAndamentos(List<Andamento> andamento) {
        andamentoAdapter.clear();
        andamentoAdapter.addAll(andamento);
    }
}
