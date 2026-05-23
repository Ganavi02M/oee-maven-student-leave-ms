package com.college.leave;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {

    private static final Logger logger =
            LoggerFactory.getLogger(App.class);

    public static void main(String[] args) {

        String result = applyLeave(
                "Ganavi M",
                "Medical Leave",
                3
        );

        logger.info(result);

        System.out.println(result);
    }

    public static String applyLeave(
            String studentName,
            String leaveReason,
            int days) {

        return "Leave applied successfully by "
                + studentName
                + " for "
                + days
                + " days. Reason: "
                + leaveReason;
    }
}
