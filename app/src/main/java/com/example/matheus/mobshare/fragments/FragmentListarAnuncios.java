package com.example.matheus.mobshare.fragments;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.matheus.mobshare.Activity.HomeActivity;
import com.example.matheus.mobshare.Model.AnunciosView;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.VisualizarAnuncioPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.VisualizarAnuncioView;
import com.squareup.picasso.Picasso;

public class FragmentListarAnuncios extends Fragment implements VisualizarAnuncioView {

    static String tag = "FragmentListarAnuncios";
    TextView txtNomeVeiculoHeader, txtValorHora, txtTipoVeiculo,
            txtAvaliacao, txtNumPessoas, txtMarca,
            txtModeloVeiculo, txtAnoVeiculo, txtQuilometragem, txtPlaca, txtEndereco, txtNomeLocador;
    ImageView img_veiculo;

    int id_anuncio;
    Button btnInteressado;

    HomeActivity activity;
    Bundle bundle;
    VisualizarAnuncioPresenter visualizarAnuncioPresenter;

    public FragmentListarAnuncios(){}

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.visualizar_anuncios,container,false);
        bundle = new Bundle();
        if(bundle != null){
            bundle = getArguments();
            id_anuncio = bundle.getInt("id_anuncio");
        }

        img_veiculo = view.findViewById(R.id.imgCarros);
        btnInteressado = view.findViewById(R.id.btnInteressado);

        txtNomeVeiculoHeader = view.findViewById(R.id.txtNomeVeiculoHeader);
        txtValorHora = view.findViewById(R.id.txtValorHora);
        txtAvaliacao = view.findViewById(R.id.txtAvaliacao);
        txtNumPessoas = view.findViewById(R.id.txtNumPessoas);
        txtMarca = view.findViewById(R.id.txtMarca);
        txtModeloVeiculo = view.findViewById(R.id.txtModeloVeiculo);
        txtAnoVeiculo = view.findViewById(R.id.txtAnoVeiculo);
        txtQuilometragem = view.findViewById(R.id.txtQuilometragem);
        txtPlaca = view.findViewById(R.id.txtPlaca);
        txtEndereco = view.findViewById(R.id.txtEndereco);
        txtNomeLocador = view.findViewById(R.id.txtNomeLocador);
        txtTipoVeiculo = view.findViewById(R.id.txtTipoVeiculo);

        visualizarAnuncioPresenter = new VisualizarAnuncioPresenter( this, ServiceFactoty.create());
        visualizarAnuncioPresenter.retonarAnuncio(id_anuncio);
        activity = (HomeActivity) getActivity();


        btnInteressado.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentManager fm = getFragmentManager();
                Fragment fragment = new FragmentSolicitarAnuncio();
                bundle.putInt("id_anuncio", id_anuncio);

                fragment.setArguments(bundle);
                fm.beginTransaction().replace(R.id.frame_layout, fragment).commit();
            }
        });
        return view;
    }
    @Override
    public void CarregarAnuncioPorId(AnunciosView anunciosView) {

        String url_foto = MobShareService.URL_FOTO + "/mobshare/view/upload/"+anunciosView.getNome_foto();
        Picasso.get().load(url_foto).into(img_veiculo);

        txtNomeVeiculoHeader.setText(anunciosView.getNome_modelo());
        txtValorHora.setText("R$ " + anunciosView.getValor_hora() + "/h");
        txtTipoVeiculo.setText(anunciosView.getNome_tipo_veiculo());
//        txtAvaliacao = findViewById(R.id.txtAvaliacao);
//        txtNumPessoas = findViewById(R.id.txtNumPessoas);
        txtMarca.setText(anunciosView.getNome_marca());
        txtModeloVeiculo.setText(anunciosView.getNome_modelo());
        txtAnoVeiculo.setText(anunciosView.getAno());
        txtQuilometragem.setText(anunciosView.getQuilometragem() + " KM");
        txtPlaca.setText(anunciosView.getPlaca());
        txtEndereco.setText(anunciosView.getRua() + ", " + anunciosView.getBairro() + " " + anunciosView.getCidade());
        txtNomeLocador.setText(anunciosView.getLocador());


    }

}
