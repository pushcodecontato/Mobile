package com.example.matheus.mobshare.adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.matheus.mobshare.Model.MeusVeiculos;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.service.MobShareService;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class MeusVeiculosAdapter extends ArrayAdapter<MeusVeiculos> {

    public MeusVeiculosAdapter(Context ctx){super(ctx,0,new ArrayList<MeusVeiculos>());}

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, ViewGroup parent) {
        View v = convertView;
        MeusVeiculos meusVeiculos = getItem(position);
        if(v == null){
            v = LayoutInflater.from(getContext()).inflate(R.layout.meus_veiculos_adapter, parent, false);
        }

        TextView txtNomeVeiculo = v.findViewById(R.id.txtNome_veiculo);
        TextView txtMarca = v.findViewById(R.id.MarcaVeiculo);
        TextView txtAno = v.findViewById(R.id.txtAnoVeiculo);
        TextView txtQuilometragem = v.findViewById(R.id.txtQuilometragem);
        ImageView imgVeiculo = v.findViewById(R.id.img_veiculo);

        String url_foto = MobShareService.URL_FOTO + "/mobshare/view/upload/"+meusVeiculos.getNome_foto();
        Picasso.get().load(url_foto).into(imgVeiculo);
        txtNomeVeiculo.setText(meusVeiculos.getNome_modelo());
        txtMarca.setText(meusVeiculos.getNome_marca());
        txtAno.setText(meusVeiculos.getAno());
        txtQuilometragem.setText(meusVeiculos.getQuilometragem() + " KM");

        return v;
    }
}
