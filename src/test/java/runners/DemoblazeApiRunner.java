package runners;

import com.intuit.karate.junit5.Karate;

public class DemoblazeApiRunner {

    @Karate.Test
    Karate testDemoblazeApi() {
        return Karate.run("classpath:features/users.feature");
    }
}