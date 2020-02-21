/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;


public class getJSonExterno {
    
    static InputStream is = null;
    static JSONObject jObj = null;
    static String json = "";

    // constructor
    public getJSonExterno() {

    }

    public JSONObject getJSONFromUrl(String url) {

        // Making HTTP request
        try {
            // defaultHttpClient
            DefaultHttpClient httpClient = new DefaultHttpClient();
            System.out.println("\n1");
            HttpPost httpPost = new HttpPost(url);
            System.out.println("\n2");
            HttpResponse httpResponse = httpClient.execute(httpPost);
            System.out.println("\n3");
            HttpEntity httpEntity = httpResponse.getEntity();
            System.out.println("\n4");
            is = httpEntity.getContent();

        } catch (Exception e) {
            System.out.println("\nerror uno");
        }

        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    is, "iso-8859-1"), 8);
            StringBuilder sb = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
                System.out.println(line);
            }
            is.close();
            json = sb.toString();

        } catch (Exception e) {
            System.out.println("\nerror 2");
        }

        // try parse the string to a JSON object
        try {
            jObj = new JSONObject(json);
        } catch (JSONException e) {
            //Log.e("JSON Parser", "Error parsing data " + e.toString());
            System.out.println("error on parse data in jsonparser.java");
        }

        // return JSON String
        return jObj;

    }
}
