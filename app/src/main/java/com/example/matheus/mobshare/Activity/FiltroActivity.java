package com.example.matheus.mobshare.Activity;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.example.matheus.mobshare.Model.MarcaVeiculo;
import com.example.matheus.mobshare.Model.TipoVeiculo;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.SpinnerMarcaPresenter;
import com.example.matheus.mobshare.presenter.SpinnerTipoVeiculoPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import java.util.List;

public class FiltroActivity extends AppCompatActivity implements CarregarSpinnersView{

    private Spinner spTipoVeiculo;
    private Spinner spMarcaVeiculo;
    MobShareService service = ServiceFactoty.create();
    SpinnerTipoVeiculoPresenter spinnerTipoVeiculoPresenter;
    SpinnerMarcaPresenter spinnerMarcaPresenter;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.filtro_layout);

        spTipoVeiculo = (Spinner) findViewById(R.id.spTipoVeiculo);
        spMarcaVeiculo = (Spinner) findViewById(R.id.spMarcaVeiculo);

        spinnerTipoVeiculoPresenter = new SpinnerTipoVeiculoPresenter(this,service);
        spinnerMarcaPresenter = new SpinnerMarcaPresenter(this, service);

        spinnerTipoVeiculoPresenter.SpinnerTipoVeiculo();
        spinnerMarcaPresenter.retornarMarca(10);
    }
    @Override
    public void carregarTipoVeiculo(final List<TipoVeiculo> tipoVeiculo) {
        ArrayAdapter<TipoVeiculo> arrayAdapter = new ArrayAdapter<>(this, R.layout.support_simple_spinner_dropdown_item, tipoVeiculo);
        arrayAdapter.setDropDownViewResource(R.layout.support_simple_spinner_dropdown_item);

        spTipoVeiculo.setAdapter(arrayAdapter);

        spTipoVeiculo.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
//                preencheSpinner(tipoVeiculo.get(position).getId_tipo_veiculo());
//                spinnerMarcaPresenter.retornarMarca(tipoVeiculo.get(position).getId_tipo_veiculo());
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }

    @Override
    public void carregarMarcaVeiculo(final List<MarcaVeiculo> marcaVeiculo) {
        ArrayAdapter<MarcaVeiculo> adapter = new ArrayAdapter<>(this, R.layout.support_simple_spinner_dropdown_item, marcaVeiculo);
        adapter.setDropDownViewResource(R.layout.support_simple_spinner_dropdown_item);

//        AdapterMarca adapter = new AdapterMarca(this,marcaVeiculo);

        spMarcaVeiculo.setAdapter(adapter);

        spMarcaVeiculo.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Log.d("TESTE MARCA:", marcaVeiculo.get(position).getNome_marca());
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }

//    class AdapterMarca extends ArrayAdapter<MarcaVeiculo> {
//
//        private Context context;
//        private ArrayList<MarcaVeiculo> items;
//
//        public AdapterMarca(Context ctx, List<MarcaVeiculo> lista) {
//            super(ctx, R.layout.item_spinner, lista);
//
//            this.context = context;
//            items = (ArrayList<MarcaVeiculo>) lista;
//
//        }
//
//
//        @NonNull
//        @Override
//        public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
//            View v = convertView;
//            if(v == null){
//                v = LayoutInflater.from(getContext()).inflate(R.layout.item_spinner,parent,false);
//            }
//             MarcaVeiculo marcaVeiculo = getItem(position);
//
//
//
//            TextView nome_marca = (TextView) v.findViewById(R.id.nome_marca_spiner);
//
//            nome_marca.setText(marcaVeiculo.getNome_marca());
//
//
//            return v;
//        }
//    }
////    public void preencheSpinner(Integer id_tipo){
////        String nome = String.valueOf(spTipoVeiculo.getSelectedItem());
////
////    }



}
