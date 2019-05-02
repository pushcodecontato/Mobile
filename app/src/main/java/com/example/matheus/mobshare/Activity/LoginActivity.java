package com.example.matheus.mobshare.Activity;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.presenter.LoginPresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.LoginView;

import java.util.List;

public class LoginActivity extends AppCompatActivity implements LoginView{
    EditText txtEmail, txtSenha;
    MobShareService service = ServiceFactoty.create();
    LoginPresenter presenter;

    private SharedPreferences sharedPreferences;
    private SharedPreferences.Editor  editor;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);


        txtEmail = findViewById(R.id.txtEmail);
        txtSenha = findViewById(R.id.txtSenha);

        sharedPreferences = getSharedPreferences("LOGIN", MODE_PRIVATE);
        editor = sharedPreferences.edit();

        presenter = new LoginPresenter((LoginView) this, service);


    }

    public void cadastrar_conta(View v){
        Intent intent = new Intent(this, CadastroActivity.class);
        startActivity(intent);
    }

    public void btnLogar(View v){
        String email = txtEmail.getText().toString();
        String senha = txtSenha.getText().toString();

        if(email.equals("") || senha.equals("")){
            Toast.makeText(getApplicationContext(), "Preencha todos os campos.",Toast.LENGTH_LONG).show();
        }
        else{
            Cliente cliente = new Cliente();

            cliente.setEmail_cliente(email);
            cliente.setSenha(senha);

            presenter.LoginPresenter(cliente);
        }
    }

    @Override
    public void showMessage(boolean autenticar, String mensagem) {
        if(autenticar == true){
            Toast.makeText(getApplicationContext(), mensagem,Toast.LENGTH_LONG).show();
            Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
            startActivity(intent);
            onDestroy();
        }else{
            Toast.makeText(getApplicationContext(), mensagem,Toast.LENGTH_LONG).show();
        }

    }

    @Override
    public void salvarDados(Cliente cliente) {
        editor.putInt("IdCliente", cliente.getId_cliente());
        editor.putString( "NomeCliente", cliente.getNome_cliente());
        editor.putString("EmailCliente", cliente.getEmail_cliente());
        editor.putString("FotoCliente", cliente.getFoto_cliente());
        editor.commit();
        Log.d("TESTE", cliente.getFoto_cliente());
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
