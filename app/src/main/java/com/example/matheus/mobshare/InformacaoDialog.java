package com.example.matheus.mobshare;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.Window;
import android.widget.EditText;

public class InformacaoDialog extends Dialog {

    EditText dtRetirada, hrRetirada, dtEntraga, hrEntrega;

    public InformacaoDialog(@NonNull Context context) {
        super(context);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.informacao_dialog);

        dtRetirada = findViewById(R.id.dtRetirada);
        hrRetirada = findViewById(R.id.hrRetirada);
        dtEntraga = findViewById(R.id.dtEntrega);
        hrRetirada = findViewById(R.id.hrEntrega);

        super.onCreate(savedInstanceState);
    }

    public void solicitarLocacao(View view){

        String dataRetirada = dtRetirada.getText().toString();
        String HoraRetirada = hrRetirada.getText().toString();
        String dataEntrega = dtEntraga.getText().toString();
        String horaEntrega = hrEntrega.getText().toString();

        int dataRetiradaFormada = new DateUtil().convertToInt(dataRetirada);
        int dataEntregaFormada = new DateUtil().convertToInt(dataEntrega);

    }
}
