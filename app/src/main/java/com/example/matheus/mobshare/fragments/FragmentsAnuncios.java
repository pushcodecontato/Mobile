package com.example.matheus.mobshare.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import com.example.matheus.mobshare.Activity.VisualizarActivityView;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.AnuncioAdapter;
import com.example.matheus.mobshare.Model.AnunciosView;
import com.example.matheus.mobshare.presenter.ListaAnuncioPresenter;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.ListaAnuncioView;

import java.util.List;


public class FragmentsAnuncios extends Fragment implements ListaAnuncioView, AdapterView.OnItemClickListener {

    AnuncioAdapter anuncioAdapter;

    ListView lstAnuncios;
    ListaAnuncioPresenter listaPresenter;

    public FragmentsAnuncios(){}

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View v = inflater.inflate(R.layout.fragment_lista_anuncios,container, false);

        lstAnuncios = v.findViewById(R.id.lstAnuncios);
        anuncioAdapter = new AnuncioAdapter(getContext());

        lstAnuncios.setAdapter(anuncioAdapter);

        lstAnuncios.setOnItemClickListener(this);

        listaPresenter = new ListaAnuncioPresenter(this, ServiceFactoty.create());

        return v;
    }

    @Override
    public void onResume() {
        super.onResume();
        listaPresenter.carregarAnuncios();
    }

    @Override
    public void PreencherListaAnuncio(List<AnunciosView> lstAnuncio) {
        anuncioAdapter.clear();
        anuncioAdapter.addAll(lstAnuncio);
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        AnunciosView anunciosView = anuncioAdapter.getItem(position);

        Intent intent = new Intent(getContext(), VisualizarActivityView.class);
        intent.putExtra("id_anuncio", anunciosView.getId_anuncio());
        startActivity(intent);
        Log.d("Id", String.valueOf(anunciosView.getId_anuncio()));
    }
}
