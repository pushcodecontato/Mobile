package com.example.matheus.mobshare.Activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.matheus.mobshare.Model.Cliente;
import com.example.matheus.mobshare.R;
import com.example.matheus.mobshare.UploadImagem;
import com.example.matheus.mobshare.Utils;
import com.example.matheus.mobshare.presenter.CadastroClientePresenter;
import com.example.matheus.mobshare.service.MobShareService;
import com.example.matheus.mobshare.service.ServiceFactoty;
import com.example.matheus.mobshare.view.CadastroClienteView;

import java.io.FileNotFoundException;
import java.io.InputStream;

import de.hdodenhof.circleimageview.CircleImageView;

public class CadastroActivity extends Activity implements CadastroClienteView{

    EditText txtNome, txtEmailCadastro, txtDtNasc, txtSenha, txtConfSenha;
    CircleImageView imgCliente;
    MobShareService service = ServiceFactoty.create();
    CadastroClientePresenter presenter;

    Bitmap imageBitmap;
    StringBuilder nomeImagem = new StringBuilder();
    byte[] imgCadastro;

    int COD_GALERIA = 1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadatrar);

        txtNome = findViewById(R.id.txtNome);
        txtEmailCadastro = findViewById(R.id.txtEmailCadastro);
        txtDtNasc = findViewById(R.id.txtDtNasc);
        txtSenha = findViewById(R.id.txtSenha);
        txtConfSenha = findViewById(R.id.txtConfSenha);
        imgCliente = findViewById(R.id.imgCadastro);

        presenter = new CadastroClientePresenter((CadastroClienteView) this,service);
    }
    public void abrirGaleria(View v){
        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
        intent.setType("image/*");
        startActivityForResult(intent, COD_GALERIA);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(requestCode == COD_GALERIA){
            if(resultCode == Activity.RESULT_OK){
                try{
                    InputStream input = getContentResolver().openInputStream(data.getData());

                    imageBitmap = BitmapFactory.decodeStream(input);

                    imgCliente.setImageBitmap(imageBitmap);
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
        super.onActivityResult(requestCode, resultCode, data);
    }
    public void btnCadastrar(View view){

        String nomeCliente = txtNome.getText().toString();
        String emailCliente = txtEmailCadastro.getText().toString();
        String dtNasc = txtDtNasc.getText().toString();
        String senha = txtSenha.getText().toString();
        String confSernha = txtConfSenha.getText().toString();

//        if(nomeCliente.equals(" ") || emailCliente.equals(" ") || dtNasc.equals(" ") || senha.equals(" ") || confSernha.equals("")){
//            Log.d("Erro", "Todos os campos precisam ser preenchidos");
//            Toast.makeText(getApplication(),"Preencha todos os campos", Toast.LENGTH_LONG).show();
//        }
//        else{
            Cliente cliente = new Cliente();
            byte[] imgCadastro = Utils.toByteArray(imageBitmap);
            String img_src = Base64.encodeToString(imgCadastro, Base64.DEFAULT);

            cliente.setFoto_cliente(img_src);
            cliente.setNome_cliente(nomeCliente);
            cliente.setEmail_cliente(emailCliente);
            cliente.setSenha(senha);
            cliente.setConf_senha(confSernha);
            cliente.setDtNascimento(dtNasc);


            Log.d("TESTE", String.valueOf(imgCadastro));
            presenter.CadastroClientePresenter(cliente);
//        }
    }



    @Override
    public void showMessageSucesso(String titulo, String mensagem, String aviso) {
        AlertDialog.Builder alert = new AlertDialog.Builder(this);
        alert.setTitle(titulo);
        alert.setMessage(mensagem + "\n\n" + aviso);

        alert.setPositiveButton("Logar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
                startActivity(intent);
            }
        });
        alert.setNegativeButton("Voltar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
                startActivity(intent);
            }
        });
        alert.show();
    }

    @Override
    public void showMessageFailed(String titulo, String mensagem) {
        Toast.makeText(getApplication(),mensagem,Toast.LENGTH_LONG).show();
        Log.d(titulo, mensagem);
    }
}
