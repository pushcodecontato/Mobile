package com.example.matheus.mobshare.adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.example.matheus.mobshare.DateUtil;
import com.example.matheus.mobshare.Model.Notificacao;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.NotificacaoPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.view.NotificacaoView;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;


public class NotificacoesAdapter extends ArrayAdapter<Notificacao>{

    NotificacaoView notificacaoView;
    NotificacaoPresenter presenter;

    public NotificacoesAdapter(Context ctx, NotificacaoView notificacaoView, NotificacaoPresenter presenter) {
        super(ctx, 0,new ArrayList<Notificacao>());
        this.notificacaoView = notificacaoView;
        this.presenter = presenter;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {

        View v = convertView;
        final Notificacao notificacao = getItem(position);
        if(v == null){
            v = LayoutInflater.from(getContext()).inflate(R.layout.notificacao_adapter, parent, false);
        }

        DateUtil dateUtil = new DateUtil();

        ImageView imgUserLocatario = v.findViewById(R.id.imgUserLocatario);
        TextView idSolicitacao = v.findViewById(R.id.idSolicitacao);
        TextView periodoInicial = v.findViewById(R.id.txtPeriodoInicial);
        TextView peridodoFinal = v.findViewById(R.id.txtPeriodoFinal);

        LinearLayout layout_aceitar = (LinearLayout) v.findViewById(R.id.btnceitar);
        LinearLayout layout_rejeitar = (LinearLayout) v.findViewById(R.id.btnRejeitar);

        String url_foto = MobShareService.URL_FOTO + "/mobshare/view/upload/"+notificacao.getFoto_cliente();
        Picasso.get().load(url_foto).placeholder(R.drawable.camera).into(imgUserLocatario);

        Log.d("TESTE", url_foto);

        String dataInicioBr = dateUtil.convertToBr(notificacao.getData_inicio());
        String dataFinalBr = dateUtil.convertToBr(notificacao.getData_final() );

        idSolicitacao.setText("Olá! O " + notificacao.getNome_cliente() + " está interessado em alugar seu veículo. " +notificacao.getNome_marca() +" " +notificacao.getNome_modelo());
        periodoInicial.setText("Período inicial: " + dataInicioBr + "-" + notificacao.getHora_inicial());
        peridodoFinal.setText("Período final: " + dataFinalBr + "-" + notificacao.getHora_final());

        layout_aceitar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                notificacao.setStatus_solicitacao(1);
                presenter.confirmarSolicitacao(notificacao);

            }
        });

        layout_rejeitar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                notificacao.setStatus_solicitacao(2);
                presenter.confirmarSolicitacao(notificacao);
            }

        });

        return v;
    }

}
