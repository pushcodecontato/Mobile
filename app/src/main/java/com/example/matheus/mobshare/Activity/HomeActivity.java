package com.example.matheus.mobshare.Activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;

import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;


import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.AnuncioAdapter;
import com.example.matheus.mobshare.fragments.FragmentsAnuncios;

public class HomeActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener{
    
    private Toolbar toolbar;
    private DrawerLayout drawerLayout;
    private NavigationView navigationView;

    private SharedPreferences sharedPreferences_home;
    private SharedPreferences.Editor editor_home;


//    TextView txtNomeCliente, txtAvaliacao;
    private ImageView imgCliente;


    FragmentManager fm;
    AnuncioAdapter anuncioAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        LayoutInflater inflater = getLayoutInflater();
        View v = inflater.inflate(R.layout.nav_header, null);

        toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        drawerLayout = (DrawerLayout) findViewById(R.id.drawerLayout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.open_drawer, R.string.close_drawer);
        drawerLayout.addDrawerListener(toggle);
        toggle.syncState();

        navigationView = (NavigationView) findViewById(R.id.navView);
        navigationView.setNavigationItemSelectedListener(this);

        fm = getSupportFragmentManager();
        anuncioAdapter = new AnuncioAdapter(this);

        sharedPreferences_home = getSharedPreferences("LOGIN", MODE_PRIVATE);
        editor_home =  sharedPreferences_home.edit();

        TextView txtNomeCliente = v.findViewById(R.id.txtNomeUsuario);
        TextView txtAvaliacao = v.findViewById(R.id.txtAvaliacao);

        String nomeCliente = sharedPreferences_home.getString("NomeCliente", "null");
//        Integer idCliente = sharedPreferences_home.getInt("IdCliente", 0);

        Log.d("TESTE: ", nomeCliente);
        txtNomeCliente.setText(nomeCliente);
    }
    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem Item) {
        switch (Item.getItemId()) {
            case R.id.nav_anuncios: {
                FragmentTransaction ft = fm.beginTransaction();
                ft.replace(R.id.frame_layout, new FragmentsAnuncios());
                ft.commit();
                break;
            }
            case R.id.nav_locados: {
                Intent intent = new Intent(this, VisualizarActivityView.class);
                startActivity(intent);
                break;
            }
            case R.id.nav_alugados: {
                Toast.makeText(this, "Menu 3", Toast.LENGTH_SHORT).show();
                Log.d("TESTE!", "Menu3 ");
                break;
            }
            case R.id.nav_veiculos: {
                Toast.makeText(this, "Menu 4", Toast.LENGTH_SHORT).show();
                Log.d("TESTE!", "Menu4 ");
                break;
            }
            default: {
                Toast.makeText(this, "Menu Default", Toast.LENGTH_SHORT).show();
                Log.d("TESTE!", "Menu5 ");
                break;
            }
        }
        drawerLayout.closeDrawer(GravityCompat.START);
        return true;
    }
}
