package com.util;

import java.util.UUID;

import javax.servlet.http.Part;
import java.io.*;


public class ImageConversion {
    public String generateAndStoreImage(Part imagePart) {
        String newImageName = "";
        try {
            // Generate a unique ID for the image
            String imageId = UUID.randomUUID().toString();

            if (imagePart != null) {
                // Get the submitted file name
                String originalImageName = imagePart.getSubmittedFileName();

                // Extract file extension
                String fileExtension = "";

                // Check if a dot exists in the originalImageName
                int dotIndex = originalImageName.lastIndexOf('.');
                if (dotIndex != -1) {
                    // Extract file extension
                    fileExtension = originalImageName.substring(dotIndex);
                } else {
                    // Handle the case where there is no dot (set a default extension or handle as needed)
                    fileExtension = ".jpg";  // Replace with your default extension
                }

                // Construct the new image name with appended ID
                newImageName = imageId + fileExtension;

                // Construct the path for storing the image
                String path = "/D:/OfficePj/BookSwapStoreV1/src/main/webapp/resources/images/books/" + newImageName;

                // Store the image
                try (FileOutputStream fileOutputStream = new FileOutputStream(path);
                     InputStream inputStream = imagePart.getInputStream()) {
                    byte[] data = new byte[inputStream.available()];
                    inputStream.read(data);
                    fileOutputStream.write(data);
                }
            } else {
                newImageName = "/D:/OfficePj/BookSwapShop/src/main/webapp/resources/images/books/defaultImage.png";
            }

            return newImageName;
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Handle the error as needed
        }
    }
}