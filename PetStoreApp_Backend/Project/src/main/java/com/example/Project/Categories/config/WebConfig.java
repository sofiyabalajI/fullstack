package com.example.Project.Categories.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

import java.io.File;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${file.upload-dir:uploads}")
    private String uploadDir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs(); // Automatically creates the folder on startup
        }

        String path = uploadFolder.getAbsolutePath().replace("\\", "/");
        if (!path.endsWith("/")) {
            path += "/";
        }

        registry.addResourceHandler("/images/**")
                .addResourceLocations(
                        "file:" + path,          // 1. Serves newly uploaded images from disk
                        "classpath:/images/"     // 2. Serves all 80 existing images from inside the JAR
                );
    }
}