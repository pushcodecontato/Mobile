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

import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.MeusVeiculosAdapter;
import com.example.matheus.mobshare.presenter.MeusVeiculosPresenter;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.MeusVeiculosView;

import java.util.List;

public class FragmentMeusVeiculos extends Fragment implements MeusVeiculosView {

    ListView lstMeusVeiculos;
    MeusVeiculosAdapter meusVeiculosAdapter;
    MeusVeiculosPresenter meusVeiculosPresenter;
    SharedPreferences sharedPreferencesMeusVeiculos;

    String nomeCliente, fotoCliente;
    Integer idCliente;
    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View v = inflater.inflate(R.layout.fragment_meus_veiculos, container, false);

        meusVeiculosPresenter = new MeusVeiculosPresenter(this, ServiceFactoty.create());
        lstMeusVeiculos = v.findViewById(R.id.lstMeusVeiculos);
        meusVeiculosAdapter = new MeusVeiculosAdapter(getContext());
        lstMeusVeiculos.setAdapter(meusVeiculosAdapter);
        sharedPreferencesMeusVeiculos = getActivity().getSharedPreferences("LOGIN", Context.MODE_PRIVATE);

        idCliente = sharedPreferencesMeusVeiculos.getInt("IdCliente", 0);

        return v;
    }

    @Override
    public void onResume() {
        meusVeiculosPresenter.retornarVeiculos(idCliente);
        super.onResume();
    }

    @Override
    public void carregarMeusVeiculos(List meusVeiculos) {
        meusVeiculosAdapter.clear();
        meusVeiculosAdapter.addAll(meusVeiculos);
    }


}
