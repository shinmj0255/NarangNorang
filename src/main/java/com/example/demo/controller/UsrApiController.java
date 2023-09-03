package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrApiController {

    @GetMapping("usr/api/areaInfo")
    @ResponseBody
    public String areaInfo() throws IOException {
        String serviceKey = "etI7sqqHopSpi3JZauJxFkgDNo3uV2a7YM6K%2FwVIiQUaoEwp38zVrbJrT01gkXxKobHJA8vBQnjdk6VWYGfmMw%3D%3D";
        String apiUrl = "https://apis.data.go.kr/B551011/KorService1";

        // API 요청 URL 구성
        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?serviceKey=").append(serviceKey);
        urlBuilder.append("&MobileOS=ETC");
        urlBuilder.append("&MobileApp=AppTest");
        urlBuilder.append("&_type=json");

        URL url = new URL(urlBuilder.toString());

        // API 호출 및 응답 데이터 읽기
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        StringBuilder result = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
        } finally {
            conn.disconnect();
        }

        // API 응답 데이터를 JSON 형식으로 반환
        JSONObject jsonResponse = new JSONObject(result.toString());

        return jsonResponse.toString();
    }
}