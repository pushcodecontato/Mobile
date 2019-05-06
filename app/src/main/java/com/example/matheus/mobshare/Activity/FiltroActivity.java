package com.example.matheus.mobshare.Activity;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.matheus.mobshare.Model.MarcaVeiculo;
import com.example.matheus.mobshare.Model.ModeloVeiculo;
import com.example.matheus.mobshare.Model.TipoVeiculo;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.fragments.FragmentsAnuncios;
import com.example.matheus.mobshare.presenter.SpinnerMarcaPresenter;
import com.example.matheus.mobshare.presenter.SpinnerModeloVeiculoPresenter;
import com.example.matheus.mobshare.presenter.SpinnerTipoVeiculoPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CarregarSpinnersView;

import java.util.List;

public class FiltroActivity extends AppCompatActivity implements CarregarSpinnersView{

    private Spinner spTipoVeiculo;
    private Spinner spMarcaVeiculo;
    private Spinner spModeloVeiculo;
    FragmentManager fm;
    MobShareService service = ServiceFactoty.create();
    SpinnerTipoVeiculoPresenter spinnerTipoVeiculoPresenter;
    SpinnerMarcaPresenter spinnerMarcaPresenter;
    SpinnerModeloVeiculoPresenter spinnerModeloVeiculoPresenter;

    Integer idTipo_Veiculo, idMarcaVeiculo, idModeloVeiculo;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.filtro_layout);

        spTipoVeiculo = (Spinner) findViewById(R.id.spTipoVeiculo);
        spMarcaVeiculo = (Spinner) findViewById(R.id.spMarcaVeiculo);
        spModeloVeiculo = (Spinner) findViewById(R.id.spModeloVeiculo);

        spinnerTipoVeiculoPresenter = new SpinnerTipoVeiculoPresenter(this,service);
        spinnerMarcaPresenter = new SpinnerMarcaPresenter(this, service);
        spinnerModeloVeiculoPresenter = new SpinnerModeloVeiculoPresenter(this, service);

        spinnerTipoVeiculoPresenter.SpinnerTipoVeiculo();

        fm = getSupportFragmentManager();
//        spinnerMarcaPresenter.retornarMarca(10);
    }
    @Override
    public void carregarTipoVeiculo(final List<TipoVeiculo> tipoVeiculo) {

        ArrayAdapter<TipoVeiculo> arrayAdapter = new ArrayAdapter<>(this, R.layout.support_simple_spinner_dropdown_item, tipoVeiculo);
        arrayAdapter.setDropDownViewResource(R.layout.support_simple_spinner_dropdown_item);
        spTipoVeiculo.setAdapter(arrayAdapter);

        spTipoVeiculo.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Log.d("ID TIPO VEICULO:", String.valueOf(tipoVeiculo.get(position).getId_tipo_veiculo()));
                Log.d("NOME TIPO VEICULO:", tipoVeiculo.get(position).getNome_tipo_veiculo());
                idTipo_Veiculo = tipoVeiculo.get(position).getId_tipo_veiculo();
                spinnerMarcaPresenter.retornarMarca(tipoVeiculo.get(position).getId_tipo_veiculo());
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

        spMarcaVeiculo.setAdapter(adapter);

        spMarcaVeiculo.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Log.d("NOME MARCA:", marcaVeiculo.get(position).getNome_marca());
                Log.d("ID MARCA:", String.valueOf(marcaVeiculo.get(position).getId_marca_veiculo()));
                idMarcaVeiculo = marcaVeiculo.get(position).getId_marca_veiculo();
                spinnerModeloVeiculoPresenter.SpinnerModeloVeiculo(marcaVeiculo.get(position).getId_marca_veiculo());

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }

    @Override
    public void carregarModeloVeiculo(final List<ModeloVeiculo> modeloVeiculos) {
        ArrayAdapter<ModeloVeiculo> adapter = new ArrayAdapter<>(this, R.layout.support_simple_spinner_dropdown_item, modeloVeiculos);
        adapter.setDropDownViewResource(R.layout.support_simple_spinner_dropdown_item);

        spModeloVeiculo.setAdapter(adapter);

        spModeloVeiculo.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Log.d("NOME MODELO:", modeloVeiculos.get(position).getNome_modelo());
                idModeloVeiculo = modeloVeiculos.get(position).getId_modelo();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }

    public void enviarFiltro(View view){

        Fragment fragment = new FragmentsAnuncios();
        Bundle bundle = new Bundle();
        bundle.putInt("idTipoVeiculo", idTipo_Veiculo);
        bundle.putInt("idMarcaVeiculo", idMarcaVeiculo);
        bundle.putInt("idModeloVeiculo", idModeloVeiculo);
        fragment.setArguments(bundle);


        FragmentTransaction ft = fm.beginTransaction();
        ft.replace(R.id.frame_layout, fragment);
        ft.commit();

        Toast.makeText(this, "OI", Toast.LENGTH_SHORT).show();
    }

}
