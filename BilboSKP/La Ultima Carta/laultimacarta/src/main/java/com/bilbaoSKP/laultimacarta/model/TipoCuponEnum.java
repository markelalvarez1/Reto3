package com.bilbaoSKP.laultimacarta.model;

public enum TipoCuponEnum {
    NORMAL(1),
    ESPECIAL(2);

    private final int id;

    TipoCuponEnum(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}