package com.dio.smartvoice.service;

import com.dio.smartvoice.model.Transaction;
import com.dio.smartvoice.repository.TransactionRepository;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.openai.OpenAiAudioTranscriptionModel;
import org.springframework.ai.openai.OpenAiAudioTranscriptionOptions;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;

@Service
public class VoiceService {

    private final ChatClient chatClient;
    private final OpenAiAudioTranscriptionModel transcriptionModel;
    private final TransactionRepository repository;

    public VoiceService(ChatClient.Builder builder, 
                        OpenAiAudioTranscriptionModel transcriptionModel,
                        TransactionRepository repository) {
        this.chatClient = builder.build();
        this.transcriptionModel = transcriptionModel;
        this.repository = repository;
    }

    public String processVoiceCommand(Resource audioFile) {
        // 1. Transcrever áudio para texto (Whisper)
        var options = OpenAiAudioTranscriptionOptions.builder()
                .withResponseFormat(OpenAiAudioTranscriptionOptions.TranscriptResponseFormat.TEXT)
                .build();
        String transcribedText = transcriptionModel.call(audioFile, options);

        // 2. IA interpreta a intenção e extrai dados (Exemplo simplificado de extração)
        String aiResponse = chatClient.prompt()
                .user("Extraia o valor e a descrição desta frase e responda no formato VALOR|DESCRIÇÃO: " + transcribedText)
                .call()
                .content();

        // 3. Salvar no banco (Simulando o processamento da resposta da IA)
        try {
            String[] parts = aiResponse.split("\\|");
            Transaction t = new Transaction();
            t.setAmount(new BigDecimal(parts[0].trim()));
            t.setDescription(parts[1].trim());
            repository.save(t);
            return "Registrado: " + t.getDescription() + " no valor de R$ " + t.getAmount();
        } catch (Exception e) {
            return "Entendi: " + transcribedText + ", mas não consegui extrair os dados financeiros.";
        }
    }
}
