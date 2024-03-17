package com.arthenyo.Loja.servicies.excptions;

public class ObjectNotFound extends RuntimeException{
    public ObjectNotFound(String msg){
        super(msg);
    }
}
