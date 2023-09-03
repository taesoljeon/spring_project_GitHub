package com.spring.service.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class NaverService {
	PrintWriter out = new PrintWriter(System.out);
	public String getAccess_token(String code, String state) {
		
		String clientId = "Kuh4ildpcXBpoQ6puw1Y";
		String redirectURI = "http://3.34.141.136:8080/spring_project/user/user_naver_login.user";
		String clientSecret = "QEQlp7nStk";
		
		String access_token = "";
		
		String getAccess_token_Url = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
		        + "&client_id=" + clientId
		        + "&client_secret=" + clientSecret
		        + "&redirect_uri=" + redirectURI
		        + "&code=" + code
		        + "&state=" + state;
		
		
		try {
		      URL url = new URL(getAccess_token_Url);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if (responseCode == 200) { // 정상 호출
		    	  
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuilder res = new StringBuilder();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if (responseCode == 200) {
		       out.println(res.toString());// JSON형태 access_token, refresh_token, 
		        //token_type, expires_in, error, error_description
		        JsonParser parser = new JsonParser(); // JSON 파싱이 필요
		        JsonElement jsonElement = parser.parse(res.toString());
		        System.out.println(jsonElement);
		        access_token = jsonElement.getAsJsonObject().get("access_token").getAsString();
		      }
		    } catch (Exception e) {
		      // Exception 로깅
		    }
		
		return access_token;
	}
	
	public String getId(String access_token) {
		
		 String id="";
		String header = "Bearer " + access_token;
		 
		String apiURL ="https://openapi.naver.com/v1/nid/me";
		
		Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);
		
        JsonParser parser = new JsonParser(); // JSON 파싱이 필요
        JsonElement jsonElement = parser.parse(responseBody);
        
        JsonElement response = jsonElement.getAsJsonObject().get("response");
        
        id = response.getAsJsonObject().get("id").getAsString();

        System.out.println(response);
        
		return id;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

	
}
