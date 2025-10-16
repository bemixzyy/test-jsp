package com.t2404.test.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class indexer {
    private int indexId;
    private String name;
    private float valueMin;
    private float valueMax;

    public int getIndexId() { return indexId; }
    public void setIndexId(int indexId) { this.indexId = indexId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public float getValueMin() { return valueMin; }
    public void setValueMin(float valueMin) { this.valueMin = valueMin; }
    public float getValueMax() { return valueMax; }
    public void setValueMax(float valueMax) { this.valueMax = valueMax; }
}
