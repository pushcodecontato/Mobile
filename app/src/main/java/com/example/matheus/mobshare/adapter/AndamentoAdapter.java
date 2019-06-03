package com.example.matheus.mobshare.adapter;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.matheus.mobshare.DateUtil;
import com.example.matheus.mobshare.Model.Andamento;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.service.MobShareService;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

import de.hdodenhof.circleimageview.CircleImageView;

public class AndamentoAdapter extends ArrayAdapter<Andamento>{

    DateUtil dateUtil;

    public AndamentoAdapter(Context context) {
        super(context, 0, new ArrayList<Andamento>());
    }

    public View getView(int position, @Nullable View convertView, ViewGroup parent) {
        View v = convertView;
        if(v == null){
            v = LayoutInflater.from(getContext()).inflate(R.layout.andamento_adapter, parent,false);
        }

        Andamento andamento = getItem(position);

        TextView txtNomeLocatario = v.findViewById(R.id.txtNomeLocatario);
        TextView txtVeiculo = v.findViewById(R.id.txtVeiculo);
        TextView txtPeriodoInicial = v.findViewById(R.id.txtPeriodoInicialAndamento);
        TextView txtPeriodoFinal = v.findViewById(R.id.txtPeriodoFinalAndamento);
        TextView txtValorTotal = v.findViewById(R.id.txtValorLocacao);

        CircleImageView imgUserAndamento = v.findViewById(R.id.imgUserAndamento);

        String url_foto = MobShareService.URL_FOTO + "/mobshare/view/upload/"+andamento.getFoto_cliente();
        Picasso.get().load(url_foto).placeholder(R.drawable.user).into(imgUserAndamento);
        dateUtil = new DateUtil();

        String dataInicio = dateUtil.convertToBr(andamento.getData_inicio());
        String dataFinal = dateUtil.convertToBr(andamento.getData_inicio());

        txtNomeLocatario.setText(andamento.getNome_cliente());
        txtVeiculo.setText(andamento.getNome_marca() + " " + andamento.getNome_modelo());
        txtPeriodoInicial.setText("Retirada: "+ dataInicio + " " + andamento.getHora_inicial());
        txtPeriodoFinal.setText("Entrega: " + dataFinal + " " + andamento.getHora_final());
        txtValorTotal.setText("Valor hora: " + andamento.getValor_hora() + " R$" + "\nValor Total: " + andamento.getValor_locacao() + " R$");


        return v;
    }
}
