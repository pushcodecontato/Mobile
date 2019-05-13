package com.example.matheus.mobshare.view;

import com.example.matheus.mobshare.Model.Cliente;

public interface LoginView {
    void showMessage(boolean autenticar, String msg);

    void salvarDados(Cliente cliente);

}
