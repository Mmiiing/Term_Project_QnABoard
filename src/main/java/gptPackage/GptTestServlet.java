package gptPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.theokanning.openai.service.OpenAiService;
import com.theokanning.openai.completion.CompletionRequest;

@WebServlet("/test-gpt")
public class GptTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/plain; charset=UTF-8");

        String apiKey = System.getenv("OPENAI_API_KEY");
        if(apiKey == null){
            resp.getWriter().println("API KEY NOT FOUND");
            return;
        }

        OpenAiService service = new OpenAiService(apiKey);

        CompletionRequest request = CompletionRequest.builder()
                .prompt("Say hello in Korean.")
                .model("text-davinci-003")
                .maxTokens(50)
                .build();

        String result = service.createCompletion(request).getChoices().get(0).getText();

        resp.getWriter().println("GPT Response: " + result);
    }
}
