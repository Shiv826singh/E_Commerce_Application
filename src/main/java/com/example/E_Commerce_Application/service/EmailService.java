package com.example.E_Commerce_Application.service;



import com.example.E_Commerce_Application.entity.Order;
import com.example.E_Commerce_Application.entity.OrderItem;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendOrderEmail(Order order)
            throws MessagingException {

        MimeMessage message =
                mailSender.createMimeMessage();

        MimeMessageHelper helper =
                new MimeMessageHelper(message, true);

        helper.setTo(order.getEmail());

        helper.setSubject(
                "Order Placed Successfully"
        );

        StringBuilder productsHtml =
                new StringBuilder();

        for(OrderItem item : order.getOrderItems()){

            productsHtml.append("""

                <div style="
                    border:1px solid #ddd;
                    padding:15px;
                    margin-bottom:10px;
                    border-radius:10px;
                ">

                    <h3>
                        """
                    + item.getProductName() +
                    """
                    </h3>

                    <p>
                        Quantity :
                        """
                    + item.getQuantity() +
                    """
                    </p>

                    <p>
                        Price :
                        ₹
                        """
                    + item.getPrice() +
                    """
                    </p>

                </div>

            """);
        }

        String html = """

        <div style="
            font-family:Arial;
            padding:20px;
        ">

            <h1 style="color:green;">
                Order Placed Successfully
            </h1>

            <p>
                Thank you for shopping with us.
            </p>

            <hr>

            <h2>Order Details</h2>

        """
                +
                productsHtml
                +
                """
        
                    <hr>
        
                    <h2>
                        Total :
                        ₹
                """
                +
                order.getFinalAmount()
                +
                """
        
                    </h2>
        
                    <p>
                        Shipping Date :
                """
                +
                order.getShippingDate()
                +
                """
        
                    </p>
        
                </div>
        
                """;

        helper.setText(html, true);

        mailSender.send(message);
    }
}