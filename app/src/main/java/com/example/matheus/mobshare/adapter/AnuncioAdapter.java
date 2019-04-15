package com.example.matheus.mobshare.adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.modelView.AnunciosView;

import java.util.ArrayList;

public class AnuncioAdapter extends ArrayAdapter<AnunciosView> {

    public AnuncioAdapter(Context ctx){
        super(ctx, 0, new ArrayList<AnunciosView>());
    }

    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent){

        View v = convertView;
        if(v == null){
            v = LayoutInflater.from(getContext()).inflate(R.layout.anuncio_adapter, parent, false);
        }

        AnunciosView anunciosView = getItem(position);

        TextView txtNome_veiculo = v.findViewById(R.id.nome_veiculo);
        TextView txtNome_locador = v.findViewById(R.id.nome_locador);
        TextView txtEndereco = v.findViewById(R.id.endereco);

        txtNome_veiculo.setText(anunciosView.getNome_marca() + " " + anunciosView.getNome_modelo());
        txtNome_locador.setText(anunciosView.getLocador());
        txtEndereco.setText(anunciosView.getRua() + " " + anunciosView.getBairro());



        return v;
    }
}
