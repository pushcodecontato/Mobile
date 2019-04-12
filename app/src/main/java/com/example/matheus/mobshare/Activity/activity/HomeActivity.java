package com.example.matheus.mobshare.Activity.activity;

import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.MenuItem;
import android.widget.Toast;


import com.example.matheus.mobshare.R;

public class HomeActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener{
    
    private Toolbar toolbar;
    private DrawerLayout drawerLayout;
    private NavigationView navigationView;
    
    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
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
    }


    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem Item) {
        switch (Item.getItemId()) {
            case R.id.nav_anuncios: {

                Toast.makeText(this, "Menu 1", Toast.LENGTH_SHORT).show();
                Log.d("TESTE!", "Menu1 ");
                break;
            }
            case R.id.nav_locados: {
                Toast.makeText(this, "Menu 2", Toast.LENGTH_SHORT).show();
                Log.d("TESTE!", "Menu2 ");
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
