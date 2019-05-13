package com.example.matheus.mobshare.fragments;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.example.matheus.mobshare.Activity.HomeActivity;
import com.example.matheus.mobshare.Model.AnunciosView;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.AnuncioAdapter;
import com.example.matheus.mobshare.presenter.ListaAnuncioPresenter;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.ListaAnuncioView;

import java.util.ArrayList;
import java.util.List;


public class FragmentsAnuncios extends Fragment implements ListaAnuncioView, AdapterView.OnItemClickListener {

    static String tag = "FragmentsAnuncios";

    AnuncioAdapter anuncioAdapter;
    HomeActivity activity;
    ListView lstAnuncios;
    ListaAnuncioPresenter listaPresenter;
    ImageView btnAbrirFiltro, imgNotFound;
    TextView txtNotFound;
    Bundle bundle;
    ArrayList<String> filtro;
    public FragmentsAnuncios(){}
    Integer id_tipo_veiculo, id_marca_veiculo, id_modelo_veiculo;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View v = inflater.inflate(R.layout.fragment_lista_anuncios,container, false);



        lstAnuncios = v.findViewById(R.id.lstAnuncios);
        btnAbrirFiltro = v.findViewById(R.id.btnAbrirFiltro);
        txtNotFound = v.findViewById(R.id.txtNotFound);
        imgNotFound = v.findViewById(R.id.imgNotFound);
        activity = (HomeActivity) getActivity();
        anuncioAdapter = new AnuncioAdapter(getContext());

        lstAnuncios.setAdapter(anuncioAdapter);

        lstAnuncios.setOnItemClickListener(this);

        listaPresenter = new ListaAnuncioPresenter(this, ServiceFactoty.create());
        filtro = new ArrayList<>();
        btnAbrirFiltro.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                FragmentManager fm = getFragmentManager();
                Fragment fragment = new FragmentFiltro();
                activity.navegarFragment(fragment, tag);
            }
        });
        return v;

    }
    @Override
    public void onResume() {
        bundle = new Bundle();
        bundle = getArguments();
        id_tipo_veiculo = 0;
        id_marca_veiculo = 0;
        id_modelo_veiculo = 0;

        if(bundle != null){
            id_tipo_veiculo = bundle.getInt("idTipoVeiculo");
            id_marca_veiculo = bundle.getInt("idMarcaVeiculo");
            id_modelo_veiculo = bundle.getInt("idModeloVeiculo");
        }


        filtro.add(String.valueOf(id_tipo_veiculo));
        filtro.add(String.valueOf(id_marca_veiculo));
        filtro.add(String.valueOf(id_modelo_veiculo));

        listaPresenter.carregarAnuncios(filtro);
        super.onResume();
    }

    @Override
    public void PreencherListaAnuncio(List<AnunciosView> lstAnuncio) {
        if(lstAnuncio.isEmpty()){
            imgNotFound.setVisibility(View.VISIBLE);
            txtNotFound.setVisibility(View.VISIBLE);
        }else{
            anuncioAdapter.clear();
            anuncioAdapter.addAll(lstAnuncio);
            imgNotFound.setVisibility(View.GONE);
            txtNotFound.setVisibility(View.GONE);
        }

    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        bundle = new Bundle();
        AnunciosView anunciosView = anuncioAdapter.getItem(position);
        Fragment fragment = new FragmentListarAnuncios();
        bundle.putInt("id_anuncio", anunciosView.getId_anuncio());
        fragment.setArguments(bundle);

        activity.navegarFragment(fragment, tag);
    }


}
