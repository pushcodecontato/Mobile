package com.example.matheus.mobshare.fragments;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.example.matheus.mobshare.Model.Andamento;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.VisualizarAndamentoPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.VisualizarAndamentoView;
import com.squareup.picasso.Picasso;

import de.hdodenhof.circleimageview.CircleImageView;

public class FragmentIniciarAndamento extends Fragment implements VisualizarAndamentoView {
    Button btnInteressadoAndamento;

    TextView txtValorTotalAndamento, txtTipoVeiculoAndamento, txtMarcaAndamento, txtModeloVeiculoAndamento
            ,txtAnoVeiculoAndamento,txtQuilometragemAndamento,txtPlacaAndamento
            ,txtNomeLocatario,txtEnderecoLocatario,txtEmailLocatario;
    CircleImageView imgUserAndamento;
    VisualizarAndamentoPresenter presenter;
    private Bundle bundle;
    private int id_locacao;


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View v = inflater.inflate(R.layout.fragment_iniciar_locacao, container,false);
        bundle = new Bundle();
        if(bundle != null){
            bundle = getArguments();
            id_locacao = bundle.getInt("id_locacao");
        }
        txtValorTotalAndamento = v.findViewById(R.id.txtValorTotalAndamento);
        txtTipoVeiculoAndamento = v.findViewById(R.id.txtTipoVeiculoAndamento);
        txtMarcaAndamento = v.findViewById(R.id.txtMarcaAndamento);
        txtModeloVeiculoAndamento = v.findViewById(R.id.txtModeloVeiculoAndamento);
        txtAnoVeiculoAndamento = v.findViewById(R.id.txtAnoVeiculoAndamento);
        txtQuilometragemAndamento = v.findViewById(R.id.txtQuilometragemAndamento);
        txtPlacaAndamento = v.findViewById(R.id.txtPlacaAndamento);

        imgUserAndamento = v.findViewById(R.id.imgUserAndamento);

        txtNomeLocatario = v.findViewById(R.id.txtNomeLocatario);
        txtEnderecoLocatario = v.findViewById(R.id.txtEnderecoLocatario);
        txtEmailLocatario = v.findViewById(R.id.txtEmailLocatario);

        btnInteressadoAndamento = v.findViewById(R.id.btnInteressadoAndamento);

        presenter = new VisualizarAndamentoPresenter(ServiceFactoty.create(), this);
        presenter.mostrarNotificacoes(id_locacao);
        btnInteressadoAndamento.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

        return v;
    }

    @Override
    public void carregarAndamendo(Andamento andamento) {
        txtValorTotalAndamento.setText("R$ " + andamento.getValor_locacao() + "");
//        txtTipoVeiculoAndamento.setText(andamento.getT);
        txtMarcaAndamento.setText(andamento.getNome_marca());
        txtModeloVeiculoAndamento.setText(andamento.getNome_modelo());
        txtAnoVeiculoAndamento.setText(andamento.getAno());
        txtQuilometragemAndamento.setText(andamento.getQuilometragem());
        txtPlacaAndamento.setText(andamento.getPlaca());

        String url_foto = MobShareService.URL_FOTO + "/mobshare/view/upload/"+andamento.getFoto_cliente();
        Picasso.get().load(url_foto).into(imgUserAndamento);

        txtNomeLocatario.setText(andamento.getNome_cliente());
        txtEnderecoLocatario.setText(andamento.getRua() + " " + andamento.getCidade() + ", " + andamento.getUf());
        txtEmailLocatario.setText(andamento.getEmail());
    }
}
