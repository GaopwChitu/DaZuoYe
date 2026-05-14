package com.work.health.bean;

import java.util.List;

public class MainMenu {
    private int id;
    private String title;
    private String path;
    private List<SubMenu> sList;

    public MainMenu() {
    }

    public MainMenu(String title, String path, List<SubMenu> sList) {
        this.title = title;
        this.path = path;
        this.sList = sList;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getPath() {
        return path;
    }

    public List<SubMenu> getsList() {
        return sList;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setsList(List<SubMenu> sList) {
        this.sList = sList;
    }

    @Override
    public String toString() {
        return "MainMenu{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", path='" + path + '\'' +
                ", sList=" + sList +
                '}';
    }
}
