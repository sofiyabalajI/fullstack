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
        // Normalize path for file protocol across Windows and Linux
        String path = new File(uploadDir).getAbsolutePath().replace("\\", "/");
        if (!path.endsWith("/")) {
            path += "/";
        }

        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:" + path);
    }
}
