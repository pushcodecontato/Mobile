package com.example.matheus.mobshare.Activity;


import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.modelView.AnunciosView;
import com.example.matheus.mobshare.presenter.VisualizarAnuncioPresenter;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.VisualizarAnuncioView;

public class VisualizarActivityView extends AppCompatActivity implements VisualizarAnuncioView {

    TextView txtNomeVeiculoHeader, txtValorHora, txtTipoVeiculo,
            txtNomeVeiculo, txtAvaliacao, txtNumPessoas, txtMarca,
            txtModeloVeiculo, txtAnoVeiculo, txtQuilometragem;
    ImageView imgCarros;
    VisualizarAnuncioPresenter visualizarAnuncioPresenter;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.visualizar_anuncios);

        int id_anuncio = getIntent().getIntExtra("id_anuncio",0);

        txtNomeVeiculoHeader = findViewById(R.id.txtNomeVeiculoHeader);
        txtValorHora = findViewById(R.id.txtValorHora);
        txtTipoVeiculo = findViewById(R.id.txtTipoVeiculo);
        txtNomeVeiculo = findViewById(R.id.txtNomeVeiculo);
        txtAvaliacao = findViewById(R.id.txtAvaliacao);
        txtNumPessoas = findViewById(R.id.txtNumPessoas);
        txtMarca = findViewById(R.id.txtMarca);
        txtModeloVeiculo = findViewById(R.id.txtModeloVeiculo);
        txtAnoVeiculo = findViewById(R.id.txtAnoVeiculo);
        txtQuilometragem = findViewById(R.id.txtQuilometragem);

        visualizarAnuncioPresenter = new VisualizarAnuncioPresenter(this, ServiceFactoty.create());
        visualizarAnuncioPresenter.retonarAnuncio(id_anuncio);

    }


    @Override
    public void CarregarAnuncioPorId(AnunciosView anunciosView) {

        txtNomeVeiculoHeader.setText(anunciosView.getNome_modelo());
//        txtValorHora = findViewById(R.id.txtValorHora);
        txtTipoVeiculo.setText(anunciosView.getTipo_veiculo());
        txtNomeVeiculo.setText(anunciosView.getNome_marca() + " " + anunciosView.getNome_modelo() );
//        txtAvaliacao = findViewById(R.id.txtAvaliacao);
//        txtNumPessoas = findViewById(R.id.txtNumPessoas);
        txtMarca.setText(anunciosView.getNome_marca());
        txtModeloVeiculo.setText(anunciosView.getNome_modelo());
        txtAnoVeiculo.setText(anunciosView.getAno());
        txtQuilometragem.setText(anunciosView.getQuilomentragem());


    }
}
