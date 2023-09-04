package com.example.demo.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UsrApiController {
	
	 public List<Map<String, Object>> getData(int areaCode, String state, int contentTypeId, int numOfRows) throws URISyntaxException, JsonProcessingException {

	        String link = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1";
	        String MobileOS = "ETC";
	        String MobileApp = "AppTest";
	        String _type = "json";
	        String serviceKey = "etI7sqqHopSpi3JZauJxFkgDNo3uV2a7YM6K%2FwVIiQUaoEwp38zVrbJrT01gkXxKobHJA8vBQnjdk6VWYGfmMw%3D%3D";

	        String url = link + "?" +
	                "&MobileOS=" + MobileOS +
	                "&MobileApp=" + MobileApp +
	                "&_type=" + _type +
	                "&areaCode=" + areaCode +
	                "&contentTypeId=" + contentTypeId +
	                "&numOfRows=" + numOfRows +
	                "&serviceKey=" + serviceKey;

	        URI uri = new URI(url);
	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        String response = restTemplate.getForObject(
	                uri,
	                String.class
	        );

	        Map<String, Object> map = new ObjectMapper().readValue(response.toString(), Map.class);
	        Map<String, Object> responseMap = (Map<String, Object>) map.get("response");
	        Map<String, Object> bodyMap = (Map<String, Object>) responseMap.get("body");
	        Map<String, Object> itemsMap = (Map<String, Object>) bodyMap.get("items");
	        List<Map<String, Object>> itemMap = (List<Map<String, Object>>) itemsMap.get("item");

	        //state에 있는 정보만 들고오기
	        List<Map<String, Object>> testItemMap = itemMap.stream()
	                .filter(item -> {
	                    Object value = item.get("addr1");
	                    return value != null && value.toString().contains(state);
	                })
	                .collect(Collectors.toList());


	        return testItemMap;
	    }

}