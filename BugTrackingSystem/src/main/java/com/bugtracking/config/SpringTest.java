
package com.bugtracking.config;

import com.bugtracking.service.BugService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class SpringTest {

    public static void main(String[] args) {

        AnnotationConfigApplicationContext context =
                new AnnotationConfigApplicationContext(SpringConfig.class);

        BugService bugService = context.getBean(BugService.class);

        System.out.println(bugService.getMessage());

        System.out.println("Total bugs in database: "
                + bugService.getTotalBugs());

        context.close();
    }
}
