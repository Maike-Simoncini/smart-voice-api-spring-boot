package com.dio.smartvoice.controller;

import com.dio.smartvoice.service.VoiceService;
import org.springframework.core.io.InputStreamResource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;

@RestController
@RequestMapping("/api/v1/voice")
public class VoiceController {

    private final VoiceService voiceService;

    public VoiceController(VoiceService voiceService) {
        this.voiceService = voiceService;
    }

    @PostMapping("/process")
    public String uploadAudio(@RequestParam("file") MultipartFile file) throws IOException {
        return voiceService.processVoiceCommand(new InputStreamResource(file.getInputStream()));
    }
}
