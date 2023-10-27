package boot.mini.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("chat.data")
@ComponentScan("boot.mini.chat")
public class SpringBootChattingApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootChattingApplication.class, args);
	}

}
