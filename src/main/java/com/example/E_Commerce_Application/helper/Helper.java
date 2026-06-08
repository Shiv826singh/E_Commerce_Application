package com.example.E_Commerce_Application.helper;

public class Helper {

    public static String get10Words(String desc) {

        if (desc == null) return "";

        String[] words = desc.split(" ");

        if (words.length > 10) {
            StringBuilder res = new StringBuilder();

            for (int i = 0; i < 10; i++) {
                res.append(words[i]).append(" ");
            }

            return res.toString().trim() + "...";
        } else {
            return desc;
        }
    }
}