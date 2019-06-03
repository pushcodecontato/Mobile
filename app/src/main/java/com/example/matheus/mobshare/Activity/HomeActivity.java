package com.example.matheus.mobshare.Activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.adapter.AnuncioAdapter;
import com.example.matheus.mobshare.fragments.FragmentAndamento;
import com.example.matheus.mobshare.fragments.FragmentMeusVeiculos;
import com.example.matheus.mobshare.fragments.FragmentNotificacoes;
import com.example.matheus.mobshare.fragments.FragmentsAnuncios;
import com.example.matheus.mobshare.service.MobShareService;
import com.squareup.picasso.Picasso;

public class HomeActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener{

    static String tag = "HomeActivity";
    private Toolbar toolbar;
    private DrawerLayout drawerLayout;
    private NavigationView navigationView;

    private SharedPreferences sharedPreferences_home;
    private SharedPreferences.Editor editor_home;


    TextView txtNomeCliente, txtAvaliacao;
    private ImageView imgCliente;


    FragmentManager fm;
    AnuncioAdapter anuncioAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        drawerLayout = (DrawerLayout) findViewById(R.id.drawerLayout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.open_drawer, R.string.close_drawer);
        drawerLayout.addDrawerListener(toggle);
        toggle.syncState();

        navigationView = (NavigationView) findViewById(R.id.navView);
        navigationView.setNavigationItemSelectedListener(this);

        View headerView = navigationView.getHeaderView(0);

        fm = getSupportFragmentManager();
        anuncioAdapter = new AnuncioAdapter(this);

        sharedPreferences_home = getSharedPreferences("LOGIN", MODE_PRIVATE);
        editor_home =  sharedPreferences_home.edit();

        txtNomeCliente = (TextView) headerView.findViewById(R.id.txtNomeUsuarioNav);
        TextView txtAvaliacao = headerView.findViewById(R.id.txtAvaliacao);
        imgCliente = headerView.findViewById(R.id.imgCliente);

        String nomeCliente = sharedPreferences_home.getString("NomeCliente", "null");
        String fotoCliente = sharedPreferences_home.getString("FotoCliente", "null");

        String url_foto = MobShareService.URL_FOTO + "/mobshare/view/upload/"+fotoCliente;
        txtNomeCliente.setText(nomeCliente);
        Picasso.get().load(url_foto).into(imgCliente);

    }
    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem Item) {
        switch (Item.getItemId()) {
            case R.id.nav_anuncios: {
                Fragment fragment = new FragmentsAnuncios();
                navegarFragment(fragment, tag);
                break;
            }
            case R.id.nav_locados: {
                Fragment fragment = new FragmentsAnuncios();
                navegarFragment(fragment, tag);
                break;
            }
            case R.id.nav_alugados: {
                Fragment fragment = new FragmentsAnuncios();
                navegarFragment(fragment, tag);
                break;
            }
            case R.id.nav_veiculos: {
                Fragment fragment = new FragmentMeusVeiculos();
                navegarFragment(fragment, tag);
                break;
            }
            case R.id.nav_notificacao: {
                Fragment fragment = new FragmentNotificacoes();
                navegarFragment(fragment, tag);
                break;
            }
            case R.id.nav_item_logout: {
                sharedPreferences_home.edit().clear().commit();
                verificar_login();
                break;
            }
            default: {
                Fragment fragment = new FragmentAndamento();
                navegarFragment(fragment, tag);
                break;
            }
        }
        drawerLayout.closeDrawer(GravityCompat.START);
        return true;
    }

    public void verificar_login(){
        if(sharedPreferences_home.contains("IdCliente")){
            Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
            startActivity(intent);
            finish();
        }
        else{
            Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
            startActivity(intent);
            finish();
        }
    }
    public void navegarFragment(Fragment fragment, String tag){
        FragmentManager fm = getSupportFragmentManager();
        fm.beginTransaction().replace(R.id.frame_layout, fragment).addToBackStack(tag).commit();
    }
}
