package com.example.matheus.mobshare.fragments;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.matheus.mobshare.DateUtil;
import com.example.matheus.mobshare.Model.SolicitacaoAnuncio;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.SolicitarAnuncioPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.SolicitarAnuncioView;

public class FragmentSolicitarAnuncio extends Fragment implements SolicitarAnuncioView {

    SharedPreferences sharedPreferences_solicitar;
    EditText dtRetirada, hrRetirada, dtEntraga, hrEntrega;
    Button btnSolicitarAnuncio;
    SolicitarAnuncioPresenter presenter;
    MobShareService mobShareService = ServiceFactoty.create();
    SolicitacaoAnuncio solicitacaoAnuncio;
    Integer id_anuncio, idCliente;
    ImageView abrirCalendario;
    public FragmentSolicitarAnuncio(){}

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_solicitar_anuncio, container, false);

        Bundle bundle = new Bundle();
        if(bundle != null){
            bundle = getArguments();
            id_anuncio = bundle.getInt("id_anuncio");
        }

        sharedPreferences_solicitar = getActivity().getSharedPreferences("LOGIN", Context.MODE_PRIVATE);
        idCliente = sharedPreferences_solicitar.getInt("IdCliente", 0);

        dtRetirada = view.findViewById(R.id.dtRetirada);
        dtEntraga = view.findViewById(R.id.dtEntrega);

        hrRetirada = view.findViewById(R.id.hrRetirada);
        hrEntrega = view.findViewById(R.id.hrEntrega);
        btnSolicitarAnuncio = view.findViewById(R.id.solicitarLocacao);
        solicitacaoAnuncio = new SolicitacaoAnuncio();


        presenter = new SolicitarAnuncioPresenter(this,mobShareService);

        btnSolicitarAnuncio.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String dataRetirada = dtRetirada.getText().toString();
                String horaRetirada = hrRetirada.getText().toString();
                String dataEntrega = dtEntraga.getText().toString();
                String horaEntrega = hrEntrega.getText().toString();

                if(!dataEntrega.equals("") || !dataRetirada.equals("") || !horaEntrega.equals("") || !horaRetirada.equals("")){


                    int dataRetiradaFormada = new DateUtil().convertToInt(dataRetirada);
                    int dataEntregaFormada = new DateUtil().convertToInt(dataEntrega);

                    solicitacaoAnuncio.setId_anuncio(id_anuncio);
                    solicitacaoAnuncio.setId_cliente(idCliente);
                    solicitacaoAnuncio.setData_inicio(String.valueOf(dataRetiradaFormada));
                    solicitacaoAnuncio.setData_final(String.valueOf(dataEntregaFormada));
                    solicitacaoAnuncio.setHora_inicial(horaRetirada);
                    solicitacaoAnuncio.setHora_final(horaEntrega);

                    presenter.SolicitarAnuncio(solicitacaoAnuncio);

                }else{
                    Toast.makeText(getContext(),"Preencha todos os campos", Toast.LENGTH_LONG).show();
                }


            }
        });


        return view;
    }
    @Override
    public void solicitarAnuncioSucesso(String mensagem) {
        Toast.makeText(getContext(), mensagem, Toast.LENGTH_LONG).show();
        FragmentManager fm = getFragmentManager();
        Fragment fragment = new FragmentsAnuncios();
        fm.beginTransaction().replace(R.id.frame_layout, fragment).commit();
    }

    @Override
    public void solicitarAnuncioFracasso(String mensagem) {
        Toast.makeText(getContext(), mensagem, Toast.LENGTH_LONG).show();
    }

}
