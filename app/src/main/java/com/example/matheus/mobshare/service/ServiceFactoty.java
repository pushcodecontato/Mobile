package com.example.matheus.mobshare.service;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ServiceFactoty {

    public static MobShareService create(){
        Retrofit retrofit = new Retrofit.Builder().
                baseUrl(MobShareService.URL_BASE).
                addConverterFactory(GsonConverterFactory.create()).
                build();

        return retrofit.create(MobShareService.class);
    }
}
