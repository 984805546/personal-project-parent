package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/06 11:45
 */

import com.fs.vo.ResponseVO;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/06 11:45
 */
@Controller
@RequestMapping("/file")
public class FileController {
    public static final String FILE_DIRECTORY = "/Users/fangchengfangcheng/Pictures/projectImages";

    @RequestMapping("/index")
    @ResponseBody
    public String index() {
        return "/load";
    }

    @PostMapping("/upload")
    @ResponseBody
    public ResponseVO upload(@RequestBody MultipartFile myfile) {
//        List<String> pathName = null;
//        for (MultipartFile file : myfile) {
//            String fileName = file.getOriginalFilename();
//            String exl = fileName.substring(fileName.lastIndexOf("."));
//            fileName = UUID.randomUUID().toString() + exl;
//            String path = FILE_DIRECTORY + File.separator + fileName;
//            pathName.add(path);
//            File f = new File(path);
//            try {
//                file.transferTo(f);
//            } catch (IOException e) {
//                e.printStackTrace();
//                throw new RuntimeException();
//            }
//        }
        String fileName = myfile.getOriginalFilename();
        String exl = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID().toString() + exl;
        String path = FILE_DIRECTORY + File.separator + fileName;
        File f = new File(path);
        try {
            myfile.transferTo(f);
            return ResponseVO.builder().code("200").msg("success").data(path).build();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @RequestMapping("/download")
    public ResponseEntity<InputStreamSource> download(String filename) throws IOException {
        String fullPath = FILE_DIRECTORY + File.separator + filename;
        File file = new File(fullPath);
        String mediaType = URLConnection.guessContentTypeFromName(filename);
        if (mediaType == null) {
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }
        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename, "UTF-8"));

        InputStreamResource isr =
                new InputStreamResource(new FileInputStream(file));
        return new ResponseEntity<>(isr, respHeaders, HttpStatus.OK);
    }
}
