package com.example.matheus.mobshare.view;

import com.example.matheus.mobshare.Model.Cliente;

import java.util.List;

public interface LoginView {
    void showMessage(boolean autenticar, String msg);

    void salvarDados(Cliente cliente);
}
