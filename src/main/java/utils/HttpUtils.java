package utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.IOException;

public class HttpUtils {
    private final String values;

    public HttpUtils(String values) {
        this.values = values;
    }
    public <T> T toModel(Class<T> tClass) {
        try {
            return new ObjectMapper().readValue(values, tClass);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return null;
    }

    public static HttpUtils of(BufferedReader reader) {
        StringBuilder sb = new StringBuilder();
        try {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            // TODO: handle exception
            System.out.print(e.getMessage());
        }

        return new HttpUtils(sb.toString());
    }
}
